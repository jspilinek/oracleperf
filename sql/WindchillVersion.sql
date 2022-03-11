DEF title = 'Windchill Version (WTUPGINST_VERSIONEDASSEMBLY WTUPGINST_INSTALLATION)';
DEF filename = 'WindchillVersion.html';
DEF nextpage = 'WindchillVersionHistory.html';
DEF prevpage = 'Exadata.html';
@@00_begin.sql

SET MARK HTML OFF;
PRO <br>
PRO <br>

SET TERMOUT OFF VER OFF FEEDBACK OFF;
SET SERVEROUTPUT ON SIZE 30000;

DECLARE
  CURSOR owner_cursor IS 
    SELECT owner FROM DBA_TABLES 
    WHERE table_name = 'WTUPGINST_VERSIONEDASSEMBLY' and num_rows > 0 and owner IN (&&schema_list)
    ORDER BY owner;

   current_owner varchar2(128);
   sqlcmd varchar(400);
   type releaseid_tab is table of varchar2(100);
   current_releaseid releaseid_tab;
   type installationid_tab is table of number;
   current_installationid installationid_tab;
   type timestamp_tab is table of varchar2(22);
   current_tstamp timestamp_tab;
BEGIN
  OPEN owner_cursor;
  LOOP
    FETCH owner_cursor INTO current_owner;
    EXIT WHEN owner_cursor%NOTFOUND;
    dbms_output.put_line('<table class=sortable>');
    dbms_output.put('<tr><th scope="col">OWNER</th>');
    dbms_output.put('<th scope="col">Windchill Release ID</th>');
    dbms_output.put('<th scope="col">Installation ID</th>');
    dbms_output.put_line('<th scope="col">Timestamp</th></tr>');
    sqlcmd := q'{SELECT wv.releaseid, wv.installationid, TO_CHAR(wi.timestamp, 'yyyy-mm-dd hh24:mi:ss') AS timestamp }'
      ||q'{FROM }'||current_owner||q'{.wtupginst_versionedassembly wv, }'
      ||current_owner||q'{.wtupginst_installation wi }'
      ||q'{WHERE wv.installationid = (select max(id) from }'
      ||current_owner||q'{.wtupginst_installation) }'
      ||q'{AND wi.id=wv.installationid }'
      ||q'{ORDER BY wv.releaseid}';
    EXECUTE IMMEDIATE sqlcmd bulk collect INTO current_releaseid, current_installationid, current_tstamp;
    for i in 1..current_releaseid.count loop
        dbms_output.put('<tr><td>'||current_owner||'</td>'); 
        dbms_output.put('<td>'||current_releaseid(i)||'</td>');
        dbms_output.put_line('<td>'||current_installationid(i)||'</td>');
        dbms_output.put_line('<td>'||current_tstamp(i)||'</td></tr>');
    end loop;
    dbms_output.put_line('</table>');
    dbms_output.put_line('<br>');
    dbms_output.put_line('<br>');
  END LOOP;
  CLOSE owner_cursor;
END;
/

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Useful when considering known Windchill SPRs.</p>

@@00_end.sql
/******** Standalone query ***********
SELECT wv.releaseid, wv.installationid, TO_CHAR(wi.timestamp, 'yyyy-mm-dd hh24:mi:ss') AS timestamp 
FROM wtupginst_versionedassembly wv, wtupginst_installation wi 
WHERE wv.installationid = (select max(id) from wtupginst_installation) 
AND wi.id=wv.installationid 
ORDER BY wv.releaseid
*/