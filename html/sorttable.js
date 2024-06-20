/*
  SortTable
  version 2
  7th April 2007
  Stuart Langridge, http://www.kryogenix.org/code/browser/sorttable/

  Instructions:
  Download this file
  Add <script src="sorttable.js"></script> to your HTML
  Add class="sortable" to any table you'd like to make sortable
  Click on the headers to sort

  Thanks to many, many people for contributions and suggestions.
  Licenced as X11: http://www.kryogenix.org/code/browser/licence.html
  This basically means: do what you want with it.
*/


var stIsIE = /*@cc_on!@*/false;

sorttable = {
  init: function() {
    // quit if this function has already been called
    if (arguments.callee.done) return;
    // flag this function so we don't do the same thing twice
    arguments.callee.done = true;
    // kill the timer
    if (_timer) clearInterval(_timer);

    if (!document.createElement || !document.getElementsByTagName) return;

    sorttable.DATE_RE = /^(\d\d?)[\/\.-](\d\d?)[\/\.-]((\d\d)?\d\d)$/;

    forEach(document.getElementsByTagName('table'), function(table) {
      if (table.className.search(/\bsortable\b/) != -1) {
        sorttable.makeSortable(table);
      }
    });

  },

  makeSortable: function(table) {
    if (table.getElementsByTagName('thead').length == 0) {
      // table doesn't have a tHead. Since it should have, create one and
      // put the first table row in it.
      the = document.createElement('thead');
      the.appendChild(table.rows[0]);
      table.insertBefore(the,table.firstChild);
    }
    // Safari doesn't support table.tHead, sigh
    if (table.tHead == null) table.tHead = table.getElementsByTagName('thead')[0];

    if (table.tHead.rows.length != 1) return; // can't cope with two header rows

    // Sorttable v1 put rows with a class of "sortbottom" at the bottom (as
    // "total" rows, for example). This is B&R, since what you're supposed
    // to do is put them in a tfoot. So, if there are sortbottom rows,
    // for backwards compatibility, move them to tfoot (creating it if needed).
    sortbottomrows = [];
    for (var i=0; i<table.rows.length; i++) {
      if (table.rows[i].className.search(/\bsortbottom\b/) != -1) {
        sortbottomrows[sortbottomrows.length] = table.rows[i];
      }
    }
    if (sortbottomrows) {
      if (table.tFoot == null) {
        // table doesn't have a tfoot. Create one.
        tfo = document.createElement('tfoot');
        table.appendChild(tfo);
      }
      for (var i=0; i<sortbottomrows.length; i++) {
        tfo.appendChild(sortbottomrows[i]);
      }
      delete sortbottomrows;
    }

    // work through each column and calculate its type
    headrow = table.tHead.rows[0].cells;
    for (var i=0; i<headrow.length; i++) {
      // manually override the type with a sorttable_type attribute
      if (!headrow[i].className.match(/\bsorttable_nosort\b/)) { // skip this col
        mtch = headrow[i].className.match(/\bsorttable_([a-z0-9]+)\b/);
        if (mtch) { override = mtch[1]; }
	      if (mtch && typeof sorttable["sort_"+override] == 'function') {
	        headrow[i].sorttable_sortfunction = sorttable["sort_"+override];
	      } else {
	        headrow[i].sorttable_sortfunction = sorttable.guessType(table,i);
	      }
	      // make it clickable to sort
	      headrow[i].sorttable_columnindex = i;
	      headrow[i].sorttable_tbody = table.tBodies[0];
	      dean_addEvent(headrow[i],"click", sorttable.innerSortFunction = function(e) {

          if (this.className.search(/\bsorttable_sorted\b/) != -1) {
            // if we're already sorted by this column, just
            // reverse the table, which is quicker
            sorttable.reverse(this.sorttable_tbody);
            this.className = this.className.replace('sorttable_sorted',
                                                    'sorttable_sorted_reverse');
            this.removeChild(document.getElementById('sorttable_sortfwdind'));
            sortrevind = document.createElement('span');
            sortrevind.id = "sorttable_sortrevind";
            sortrevind.innerHTML = stIsIE ? '&nbsp<font face="webdings">5</font>' : '&nbsp;&#x25B4;';
            this.appendChild(sortrevind);
            return;
          }
          if (this.className.search(/\bsorttable_sorted_reverse\b/) != -1) {
            // if we're already sorted by this column in reverse, just
            // re-reverse the table, which is quicker
            sorttable.reverse(this.sorttable_tbody);
            this.className = this.className.replace('sorttable_sorted_reverse',
                                                    'sorttable_sorted');
            this.removeChild(document.getElementById('sorttable_sortrevind'));
            sortfwdind = document.createElement('span');
            sortfwdind.id = "sorttable_sortfwdind";
            sortfwdind.innerHTML = stIsIE ? '&nbsp<font face="webdings">6</font>' : '&nbsp;&#x25BE;';
            this.appendChild(sortfwdind);
            return;
          }

          // remove sorttable_sorted classes
          theadrow = this.parentNode;
          forEach(theadrow.childNodes, function(cell) {
            if (cell.nodeType == 1) { // an element
              cell.className = cell.className.replace('sorttable_sorted_reverse','');
              cell.className = cell.className.replace('sorttable_sorted','');
            }
          });
          sortfwdind = document.getElementById('sorttable_sortfwdind');
          if (sortfwdind) { sortfwdind.parentNode.removeChild(sortfwdind); }
          sortrevind = document.getElementById('sorttable_sortrevind');
          if (sortrevind) { sortrevind.parentNode.removeChild(sortrevind); }

          this.className += ' sorttable_sorted';
          sortfwdind = document.createElement('span');
          sortfwdind.id = "sorttable_sortfwdind";
          sortfwdind.innerHTML = stIsIE ? '&nbsp<font face="webdings">6</font>' : '&nbsp;&#x25BE;';
          this.appendChild(sortfwdind);

	        // build an array to sort. This is a Schwartzian transform thing,
	        // i.e., we "decorate" each row with the actual sort key,
	        // sort based on the sort keys, and then put the rows back in order
	        // which is a lot faster because you only do getInnerText once per row
	        row_array = [];
	        col = this.sorttable_columnindex;
	        rows = this.sorttable_tbody.rows;
	        for (var j=0; j<rows.length; j++) {
	          row_array[row_array.length] = [sorttable.getInnerText(rows[j].cells[col]), rows[j]];
	        }
	        /* If you want a stable sort, uncomment the following line */
	        //sorttable.shaker_sort(row_array, this.sorttable_sortfunction);
	        /* and comment out this one */
	        row_array.sort(this.sorttable_sortfunction);

	        tb = this.sorttable_tbody;
	        for (var j=0; j<row_array.length; j++) {
	          tb.appendChild(row_array[j][1]);
	        }

	        delete row_array;
	      });
	    }
    }
  },

  guessType: function(table, column) {
    // guess the type of a column based on its first non-blank row
    sortfn = sorttable.sort_alpha;
    for (var i=0; i<table.tBodies[0].rows.length; i++) {
      text = sorttable.getInnerText(table.tBodies[0].rows[i].cells[column]);
      if (text != '') {
        if (text.match(/^-?[�$�]?[\d,.]+%?$/)) {
          return sorttable.sort_numeric;
        }
        // check for a date: dd/mm/yyyy or dd/mm/yy
        // can have / or . or - as separator
        // can be mm/dd as well
        possdate = text.match(sorttable.DATE_RE)
        if (possdate) {
          // looks like a date
          first = parseInt(possdate[1]);
          second = parseInt(possdate[2]);
          if (first > 12) {
            // definitely dd/mm
            return sorttable.sort_ddmm;
          } else if (second > 12) {
            return sorttable.sort_mmdd;
          } else {
            // looks like a date, but we can't tell which, so assume
            // that it's dd/mm (English imperialism!) and keep looking
            sortfn = sorttable.sort_ddmm;
          }
        }
      }
    }
    return sortfn;
  },

  getInnerText: function(node) {
    // gets the text we want to use for sorting for a cell.
    // strips leading and trailing whitespace.
    // this is *not* a generic getInnerText function; it's special to sorttable.
    // for example, you can override the cell text with a customkey attribute.
    // it also gets .value for <input> fields.

    if (!node) return "";

    hasInputs = (typeof node.getElementsByTagName == 'function') &&
                 node.getElementsByTagName('input').length;

    if (node.getAttribute("sorttable_customkey") != null) {
      return node.getAttribute("sorttable_customkey");
    }
    else if (typeof node.textContent != 'undefined' && !hasInputs) {
      return node.textContent.replace(/^\s+|\s+$/g, '');
    }
    else if (typeof node.innerText != 'undefined' && !hasInputs) {
      return node.innerText.replace(/^\s+|\s+$/g, '');
    }
    else if (typeof node.text != 'undefined' && !hasInputs) {
      return node.text.replace(/^\s+|\s+$/g, '');
    }
    else {
      switch (node.nodeType) {
        case 3:
          if (node.nodeName.toLowerCase() == 'input') {
            return node.value.replace(/^\s+|\s+$/g, '');
          }
        case 4:
          return node.nodeValue.replace(/^\s+|\s+$/g, '');
          break;
        case 1:
        case 11:
          var innerText = '';
          for (var i = 0; i < node.childNodes.length; i++) {
            innerText += sorttable.getInnerText(node.childNodes[i]);
          }
          return innerText.replace(/^\s+|\s+$/g, '');
          break;
        default:
          return '';
      }
    }
  },

  reverse: function(tbody) {
    // reverse the rows in a tbody
    newrows = [];
    for (var i=0; i<tbody.rows.length; i++) {
      newrows[newrows.length] = tbody.rows[i];
    }
    for (var i=newrows.length-1; i>=0; i--) {
       tbody.appendChild(newrows[i]);
    }
    delete newrows;
  },

  /* sort functions
     each sort function takes two parameters, a and b
     you are comparing a[0] and b[0] */
  sort_numeric: function(a,b) {
    aa = parseFloat(a[0].replace(/[^0-9.-]/g,''));
    if (isNaN(aa)) aa = 0;
    bb = parseFloat(b[0].replace(/[^0-9.-]/g,''));
    if (isNaN(bb)) bb = 0;
    return aa-bb;
  },
  sort_alpha: function(a,b) {
    if (a[0]==b[0]) return 0;
    if (a[0]<b[0]) return -1;
    return 1;
  },
  sort_ddmm: function(a,b) {
    mtch = a[0].match(sorttable.DATE_RE);
    y = mtch[3]; m = mtch[2]; d = mtch[1];
    if (m.length == 1) m = '0'+m;
    if (d.length == 1) d = '0'+d;
    dt1 = y+m+d;
    mtch = b[0].match(sorttable.DATE_RE);
    y = mtch[3]; m = mtch[2]; d = mtch[1];
    if (m.length == 1) m = '0'+m;
    if (d.length == 1) d = '0'+d;
    dt2 = y+m+d;
    if (dt1==dt2) return 0;
    if (dt1<dt2) return -1;
    return 1;
  },
  sort_mmdd: function(a,b) {
    mtch = a[0].match(sorttable.DATE_RE);
    y = mtch[3]; d = mtch[2]; m = mtch[1];
    if (m.length == 1) m = '0'+m;
    if (d.length == 1) d = '0'+d;
    dt1 = y+m+d;
    mtch = b[0].match(sorttable.DATE_RE);
    y = mtch[3]; d = mtch[2]; m = mtch[1];
    if (m.length == 1) m = '0'+m;
    if (d.length == 1) d = '0'+d;
    dt2 = y+m+d;
    if (dt1==dt2) return 0;
    if (dt1<dt2) return -1;
    return 1;
  },

  shaker_sort: function(list, comp_func) {
    // A stable sort function to allow multi-level sorting of data
    // see: http://en.wikipedia.org/wiki/Cocktail_sort
    // thanks to Joseph Nahmias
    var b = 0;
    var t = list.length - 1;
    var swap = true;

    while(swap) {
        swap = false;
        for(var i = b; i < t; ++i) {
            if ( comp_func(list[i], list[i+1]) > 0 ) {
                var q = list[i]; list[i] = list[i+1]; list[i+1] = q;
                swap = true;
            }
        } // for
        t--;

        if (!swap) break;

        for(var i = t; i > b; --i) {
            if ( comp_func(list[i], list[i-1]) < 0 ) {
                var q = list[i]; list[i] = list[i-1]; list[i-1] = q;
                swap = true;
            }
        } // for
        b++;

    } // while(swap)
  }
}

/* ******************************************************************
   Supporting functions: bundled here to avoid depending on a library
   ****************************************************************** */

// Dean Edwards/Matthias Miller/John Resig

/* for Mozilla/Opera9 */
if (document.addEventListener) {
    document.addEventListener("DOMContentLoaded", sorttable.init, false);
}

/* for Internet Explorer */
/*@cc_on @*/
/*@if (@_win32)
    document.write("<script id=__ie_onload defer src=javascript:void(0)><\/script>");
    var script = document.getElementById("__ie_onload");
    script.onreadystatechange = function() {
        if (this.readyState == "complete") {
            sorttable.init(); // call the onload handler
        }
    };
/*@end @*/

/* for Safari */
if (/WebKit/i.test(navigator.userAgent)) { // sniff
    var _timer = setInterval(function() {
        if (/loaded|complete/.test(document.readyState)) {
            sorttable.init(); // call the onload handler
        }
    }, 10);
}

/* for other browsers */
window.onload = sorttable.init;

// written by Dean Edwards, 2005
// with input from Tino Zijdel, Matthias Miller, Diego Perini

// http://dean.edwards.name/weblog/2005/10/add-event/

function dean_addEvent(element, type, handler) {
	if (element.addEventListener) {
		element.addEventListener(type, handler, false);
	} else {
		// assign each event handler a unique ID
		if (!handler.$$guid) handler.$$guid = dean_addEvent.guid++;
		// create a hash table of event types for the element
		if (!element.events) element.events = {};
		// create a hash table of event handlers for each element/event pair
		var handlers = element.events[type];
		if (!handlers) {
			handlers = element.events[type] = {};
			// store the existing event handler (if there is one)
			if (element["on" + type]) {
				handlers[0] = element["on" + type];
			}
		}
		// store the event handler in the hash table
		handlers[handler.$$guid] = handler;
		// assign a global event handler to do all the work
		element["on" + type] = handleEvent;
	}
};
// a counter used to create unique IDs
dean_addEvent.guid = 1;

function removeEvent(element, type, handler) {
	if (element.removeEventListener) {
		element.removeEventListener(type, handler, false);
	} else {
		// delete the event handler from the hash table
		if (element.events && element.events[type]) {
			delete element.events[type][handler.$$guid];
		}
	}
};

function handleEvent(event) {
	var returnValue = true;
	// grab the event object (IE uses a global event object)
	event = event || fixEvent(((this.ownerDocument || this.document || this).parentWindow || window).event);
	// get a reference to the hash table of event handlers
	var handlers = this.events[event.type];
	// execute each event handler
	for (var i in handlers) {
		this.$$handleEvent = handlers[i];
		if (this.$$handleEvent(event) === false) {
			returnValue = false;
		}
	}
	return returnValue;
};

function fixEvent(event) {
	// add W3C standard event methods
	event.preventDefault = fixEvent.preventDefault;
	event.stopPropagation = fixEvent.stopPropagation;
	return event;
};
fixEvent.preventDefault = function() {
	this.returnValue = false;
};
fixEvent.stopPropagation = function() {
  this.cancelBubble = true;
}

// Dean's forEach: http://dean.edwards.name/base/forEach.js
/*
	forEach, version 1.0
	Copyright 2006, Dean Edwards
	License: http://www.opensource.org/licenses/mit-license.php
*/

// array-like enumeration
if (!Array.forEach) { // mozilla already supports this
	Array.forEach = function(array, block, context) {
		for (var i = 0; i < array.length; i++) {
			block.call(context, array[i], i, array);
		}
	};
}

// generic enumeration
Function.prototype.forEach = function(object, block, context) {
	for (var key in object) {
		if (typeof this.prototype[key] == "undefined") {
			block.call(context, object[key], key, object);
		}
	}
};

// character enumeration
String.forEach = function(string, block, context) {
	Array.forEach(string.split(""), function(chr, index) {
		block.call(context, chr, index, string);
	});
};

// globally resolve forEach enumeration
var forEach = function(object, block, context) {
	if (object) {
		var resolve = Object; // default
		if (object instanceof Function) {
			// functions have a "length" property
			resolve = Function;
		} else if (object.forEach instanceof Function) {
			// the object implements a custom forEach method so use that
			object.forEach(block, context);
			return;
		} else if (typeof object == "string") {
			// the object is a string
			resolve = String;
		} else if (typeof object.length == "number") {
			// the object is array-like
			resolve = Array;
		}
		resolve.forEach(object, block, context);
	}
};




/*
  Below are customizations for oracle report
  - Highlighting important table rows
  - Warning red text for table cell values
*/

function oracleperf(filename){
  switch (filename){
    case "ImportantParam.html":
      ImportantParam();
      break;
    case "NonDefaultParam.html":
    case "ModifiedParam.html":
    case "AllParam.html":
      HighlightHiddenParam();
      break;
    case "SgaInfo.html":
      SgaInfo();
      break;
    case "SgaTargetAdvice.html":
      SgaTargetAdvice();
      break;
    case "MemoryTargetAdvice.html":
      MemoryTargetAdvice();
      break;
    case "DbCacheAdvice.html":
      DbCacheAdvice();
      break;
    case "PgaTargetAdvice.html":
      PgaTargetAdvice();
      break;
    case "SharedPoolAdvice.html":
      SharedPoolAdvice();
      break;
    case "DiskIO.html":
      DiskIO(0);
      DiskIO(1);
      break;
    case "UndoCheck.html":
      UndoCheck();
      break;
    case "TablesWithoutIndexes.html":
      TablesWithoutIndexes();
      break;
    case "IdColumnNoIndexes.html":
      IdColumnNoIndexes();
      break;
    case "PerfTablesAge.html":
      PerfTablesAge();
      break;
  }

}

function highlightRow(rows, rowNum){
  rows[rowNum].className = 'highlightRow';    
}

function enableWarning(rows, rowNum, colNum){
  rows[rowNum].children[colNum].className = 'warn';    
}

function isNotBackupTable(tableName){
  if (tableName.indexOf('_') > -1)
    if(!tableName.endsWith('_EFF'))
      return false;
  if (tableName.endsWith('BKP'))
    return false;
  if (tableName.endsWith('BAK'))
    return false;
  if (tableName.startsWith('MIG$'))
    return false;
  
  return true;
}

/*****************************************************************************************************
//Red warning text if parameter not set to recommended value
*****************************************************************************************************/
function ImportantParam(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colName = 0;
  var colValue = 0;
  var colDisplayValue = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'NAME'){
          colName = i;
      }else if (columnHeader == 'VALUE'){
          colValue = i;
      }else if (columnHeader == 'DISPLAY_VALUE'){
          colDisplayValue = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textName = rows[i].children[colName].innerText;
      var textValue = rows[i].children[colValue].innerText;
      var textDisplayValue = rows[i].children[colDisplayValue].innerText;
      if (textName == 'optimizer_adaptive_features'){
          if(textValue != 'FALSE'){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 'FALSE'){
              enableWarning(rows,i,colDisplayValue);
          }
      }
      if (textName == 'optimizer_adaptive_statistics'){
          if(textValue != 'FALSE'){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 'FALSE'){
              enableWarning(rows,i,colDisplayValue);
          }
      }
      if (textName == 'optimizer_dynamic_sampling'){
          if(textValue != 2){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 2){
              enableWarning(rows,i,colDisplayValue);
          }
      }
      if (textName == 'optimizer_index_caching'){
          if(textValue != 0){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 0){
              enableWarning(rows,i,colDisplayValue);
          }
      }
      if (textName == 'optimizer_index_cost_adj'){
          if(textValue != 10){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 10){
              enableWarning(rows,i,colDisplayValue);
          }
      }
      if (textName == 'optimizer_mode'){
          if(textValue != 'ALL_ROWS'){
              enableWarning(rows,i,colValue);
          }
          if(textDisplayValue != 'ALL_ROWS'){
              enableWarning(rows,i,colDisplayValue);
          }
      }
  }
}

/*****************************************************************************************************
//Highlight rows with hidden parameters (parameter name starts with underscore)
*****************************************************************************************************/
function HighlightHiddenParam(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colName = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'NAME'){
          colName = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textName = rows[i].children[colName].innerText;

      if(textName.startsWith("_")){
          highlightRow(rows,i);
      }
  }
}

/*****************************************************************************************************
//Highlight row with 'Free SGA Memory Available'
//Red warning text if 'Buffer Cache Size' percentage < 75
*****************************************************************************************************/
function SgaInfo(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colName = 0;
  var colPercentage = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'NAME'){
          colName = i;
      }else if (columnHeader == 'Percentage'){
          colPercentage = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textName = rows[i].children[colName].innerText;
      if(textName == 'Free SGA Memory Available'){
          highlightRow(rows,i);
      }else if(textName == 'Buffer Cache Size'){
          var cellText = rows[i].children[colPercentage].innerText;
          if(cellText < 75){
              enableWarning(rows,i,colPercentage);
          }
      }
  }
}

/*****************************************************************************************************
//Highlight row with SIZE_FACTOR == 1
//Red warning text if ESTD_PCT_OF_DB_TIME_FOR_READS > 10
*****************************************************************************************************/
function DbCacheAdvice(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var sizeFactor = 0;
  var estdReads = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'SIZE_FACTOR'){
          sizeFactor = i;
      }else if (columnHeader == 'ESTD_PCT_OF_DB_TIME_FOR_READS'){
          estdReads = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var cellText = rows[i].children[sizeFactor].innerText;
      if (cellText == 1){
          highlightRow(rows,i);
      }
      cellText = rows[i].children[estdReads].innerText;
      if (cellText > 10){
          enableWarning(rows,i,estdReads);
      }
  }
}

/*****************************************************************************************************
//Highlight row with PGA_TARGET_FACTOR == 1
//Red warning text if ESTD_PGA_CACHE_HIT_PERCENTAGE < 90
*****************************************************************************************************/
function PgaTargetAdvice(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var sizeFactor = 0;
  var estdHits = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'PGA_TARGET_FACTOR'){
          sizeFactor = i;
      }else if (columnHeader == 'ESTD_PGA_CACHE_HIT_PERCENTAGE'){
        estdHits = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var cellText = rows[i].children[sizeFactor].innerText;
      if (cellText == 1){
          highlightRow(rows,i);
      }
      cellText = rows[i].children[estdHits].innerText;
      if (cellText < 90){
          enableWarning(rows,i,estdHits);
      }
  }
}

/*****************************************************************************************************
//Highlight row with SGA_SIZE_FACTOR == 1
*****************************************************************************************************/
function SgaTargetAdvice(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var sizeFactor = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'SGA_SIZE_FACTOR'){
          sizeFactor = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var cellText = rows[i].children[sizeFactor].innerText;
      if (cellText == 1){
          highlightRow(rows,i);
      }
  }
}

/*****************************************************************************************************
//Highlight row with MEMORY_SIZE_FACTOR == 1
*****************************************************************************************************/
function MemoryTargetAdvice(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var sizeFactor = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'MEMORY_SIZE_FACTOR'){
          sizeFactor = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var cellText = rows[i].children[sizeFactor].innerText;
      if (cellText == 1){
          highlightRow(rows,i);
      }
  }
}

/*****************************************************************************************************
//Highlight row with SHARED_POOL_SIZE_FACTOR == 1
*****************************************************************************************************/
function SharedPoolAdvice(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var sizeFactor = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'SHARED_POOL_SIZE_FACTOR'){
          sizeFactor = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var cellText = rows[i].children[sizeFactor].innerText;
      if (cellText == 1){
          highlightRow(rows,i);
      }
  }
}

/*****************************************************************************************************
//Red warning text if 'AvgReadTime (ms)' or 'AvgWriteTime (ms)' >= 10
*****************************************************************************************************/
function DiskIO(tableID){
  var table = document.getElementsByClassName("sortable")[tableID];
  var rows = table.rows;

  var colRead = 0;
  var colWrite = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'AvgReadTime (ms)'){
        colRead = i;
      }else if (columnHeader == 'AvgWriteTime (ms)'){
        colWrite = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textRead = rows[i].children[colRead].innerText;
      var textWrite = rows[i].children[colWrite].innerText;
      if (textRead >= 10){
        enableWarning(rows,i,colRead);
      }
      if (textWrite >= 10){
        enableWarning(rows,i,colWrite);
      }
  }
}

/*****************************************************************************************************
  Red warning text if 'ACTUAL UNDO SIZE [MB]' < 'NEEDED UNDO SIZE [MB]'
*****************************************************************************************************/
function UndoCheck(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colActual = 0;
  var colNeeded = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'ACTUAL UNDO SIZE [MB]'){
        colActual = i;
      }else if (columnHeader == 'NEEDED UNDO SIZE [MB]'){
        colNeeded = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textActual = rows[i].children[colActual].innerText;
      var textNeeded = rows[i].children[colNeeded].innerText;
      var intActual = parseInt(textActual.replace(/\,/g,''));
      var intNeeded = parseInt(textNeeded.replace(/\,/g,''));
      if (intActual < intNeeded){
        enableWarning(rows,i,colActual);
      }
  }
}

/*****************************************************************************************************
  Red warning text if table is not a backup
*****************************************************************************************************/
function TablesWithoutIndexes(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colTableName;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'TABLE_NAME'){
        colTableName = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textTableName = rows[i].children[colTableName].innerText;
      if(isNotBackupTable(textTableName))
        enableWarning(rows,i,colTableName);
  }
}

/*****************************************************************************************************
  Red warning text if table is not a backup and column is IDA2A2
*****************************************************************************************************/
function IdColumnNoIndexes(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colTableName;
  var colColumnName;
  for (var i = 0; i < rows[0].childElementCount; i++){
      columnHeader = rows[0].children[i].innerText;
      if (columnHeader == 'TABLE_NAME'){
        colTableName = i;
      }else if (columnHeader == 'COLUMN_NAME'){
        colColumnName = i;
      }
  }
  
  for (var i = 1; i < rows.length; i++){
      var textTableName = rows[i].children[colTableName].innerText;
      var textColumnName = rows[i].children[colColumnName].innerText;
      if(isNotBackupTable(textTableName)){
        if(textColumnName == 'IDA2A2'){
          enableWarning(rows,i,colTableName);
          enableWarning(rows,i,colColumnName);
        }
      }
  }
}

/*****************************************************************************************************
  Red warning text if 'Days Old' > threshold
  Thresholds defined in article CS44623
*****************************************************************************************************/
function PerfTablesAge(){
  var table = document.getElementsByClassName("sortable")[0];
  var rows = table.rows;

  var colName = 0;
  var colDays = 0;
  for (var i = 0; i < rows[0].childElementCount; i++){
    columnHeader = rows[0].children[i].innerText;
    if (columnHeader == 'OWNER.TABLE_NAME'){
      colName = i;
    }else if (columnHeader == 'Days Old'){
      colDays = i;
    }
  }
  
  for (var i = 1; i < rows.length; i++){
    var textName = rows[i].children[colName].innerText;
    var textDays = rows[i].children[colDays].innerText;
    
    const tableName = textName.substring(textName.indexOf('.')+1);

    switch (tableName){
      case "CACHESTATISTICS":
      case "RAWMETHODCONTEXTSTATS":
      case "RAWSERVLETREQUESTSTATS":
      case "REMOTECACHESERVERCALLS":
      case "RMIPERFDATA":
      case "SAMPLEDMETHODCONTEXTS":
      case "SAMPLEDSERVLETREQUESTS":
      case "TOPSQLSTATS":
        if (textDays > 4){
          enableWarning(rows,i,colDays);
        }
        break;
      case "JMXNOTIFICATIONS":
      case "LOG4JAVASCRIPTEVENTS":
      case "METHODCONTEXTS":
      case "MISCLOGEVENTS":
      case "SERVLETREQUESTS":
        if (textDays > 15){
          enableWarning(rows,i,colDays);
        }
        break;
      case "METHODCONTEXTSTATS":
      case "METHODSERVERINFO":
      case "MSHEALTHSTATS":
      case "REQUESTHISTOGRAMS":
      case "RMIHISTOGRAMS":
      case "SERVERMANAGERINFO":
      case "SERVLETREQUESTSTATS":
      case "SERVLETSESSIONSTATS":
      case "SMHEALTHSTATS":
      case "USERAGENTINFO":
        if (textDays > 120){
          enableWarning(rows,i,colDays);
        }
        break;
    }      
  }
}

