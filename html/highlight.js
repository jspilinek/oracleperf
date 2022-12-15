function ImportantParam(){
    var table = document.getElementsByClassName("sortable")[0];
    var rows = table.rows;
    //Find columns
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
    
    //Update className
    for (var i = 1, enableWarning = [false,false]; i < rows.length; i++, enableWarning=[false,false]){
        var textName = rows[i].children[colName].innerText;
        var textValue = rows[i].children[colValue].innerText;
        var textDisplayValue = rows[i].children[colDisplayValue].innerText;
        if (textName == 'optimizer_adaptive_features'){
            if(textValue != 'FALSE'){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 'FALSE'){
                enableWarning[1] = true;
            }
        }
        if (textName == 'optimizer_adaptive_statistics'){
            if(textValue != 'FALSE'){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 'FALSE'){
                enableWarning[1] = true;
            }
        }
        if (textName == 'optimizer_dynamic_sampling'){
            if(textValue != 2){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 2){
                enableWarning[1] = true;
            }
        }
        if (textName == 'optimizer_index_caching'){
            if(textValue != 0){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 0){
                enableWarning[1] = true;
            }
        }
        if (textName == 'optimizer_index_cost_adj'){
            if(textValue != 10){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 10){
                enableWarning[1] = true;
            }
        }
        if (textName == 'optimizer_mode'){
            if(textValue != 'ALL_ROWS'){
                enableWarning[0] = true;
            }
            if(textDisplayValue != 'ALL_ROWS'){
                enableWarning[1] = true;
            }
        }
        if (enableWarning[0]){
            rows[i].children[colValue].className = 'warn';
        }
        if (enableWarning[1]){
            rows[i].children[colDisplayValue].className = 'warn';
        }
    }
}

function DbCacheAdvice(){
    var table = document.getElementsByClassName("sortable")[0];
    var rows = table.rows;
    //Find columns
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
    
    //Update className
    for (var i = 1; i < rows.length; i++){
        var cellText = rows[i].children[sizeFactor].innerText;
        if (cellText == 1){
            rows[i].className = 'active';
        }
        cellText = rows[i].children[estdReads].innerText;
        if (cellText > 10){
            rows[i].children[estdReads].className = 'warn';
        }
    }
}