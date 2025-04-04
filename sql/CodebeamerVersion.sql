DEF title = 'Codebeamer Version';
DEF filename = 'CodebeamerVersion.html';
DEF nextpage = 'Uptime.html';
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
    WHERE table_name = 'VERSION' and num_rows > 0 and owner IN (&&schema_list)
    ORDER BY owner;

   current_owner varchar2(128);
   sqlcmd varchar(400);
   type major_tab is table of varchar2(100);
   current_major major_tab;
   type minor_tab is table of varchar2(100);
   current_minor minor_tab;
BEGIN
  OPEN owner_cursor;
  LOOP
    FETCH owner_cursor INTO current_owner;
    EXIT WHEN owner_cursor%NOTFOUND;
    dbms_output.put_line('<table class=sortable>');
    dbms_output.put('<tr><th scope="col">OWNER</th>');
    dbms_output.put('<th scope="col">Major</th>');
    dbms_output.put('<th scope="col">Minor</th>');
    sqlcmd := q'{SELECT major, minor }'
      ||q'{FROM }'||current_owner||q'{.version}';
    EXECUTE IMMEDIATE sqlcmd bulk collect INTO current_major, current_minor;
    for i in 1..current_major.count loop
        dbms_output.put('<tr><td>'||current_owner||'</td>'); 
        dbms_output.put('<td>'||current_major(i)||'</td>');
        dbms_output.put_line('<td>'||current_minor(i)||'</td></tr>');
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
PRO <p>Useful when considering known Codebeamer bugs.</p>

@@00_end.sql
/******** Standalone query ***********
SELECT major, minor
FROM version
*/