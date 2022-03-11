DEF title = 'Age of JMX Database Logging Tables aka Performance Tables (dba_tab_columns dba_tables)';
DEF filename = 'PerfTablesAge.html';
DEF nextpage = 'QueueEntry.html';
DEF prevpage = 'TransientTables.html';
@@00_begin.sql

SET MARK HTML OFF;
PRO <br>
PRO <br>

SET TERMOUT OFF VER OFF FEEDBACK OFF;
SET SERVEROUTPUT ON SIZE 30000;

DECLARE
  CURSOR owner_cursor IS 
    WITH PerfTables as (SELECT tab.owner, tab.table_name
        FROM dba_tab_columns col, dba_tables tab
        WHERE col.owner IN (&&schema_list)
            AND tab.table_name=col.table_name 
            AND tab.owner=col.owner
            AND col.column_name = 'LE_TIMESTAMP')
    SELECT PerfTables.owner||'.'||PerfTables.table_name 
    FROM PerfTables
    ORDER BY PerfTables.owner, PerfTables.table_name;

   current_owner_table varchar2(128);
   sqlcmd varchar(1000);
   type min_le_timestamp is table of TIMESTAMP(6);
   current_min_le_timestamp min_le_timestamp;
   type max_le_timestamp is table of TIMESTAMP(6);
   current_max_le_timestamp max_le_timestamp;
   type days_old is table of number;
   current_days_old days_old;

BEGIN
  dbms_output.put_line('<table class=sortable>');
  dbms_output.put('<tr><th scope="col">OWNER.TABLE_NAME</th>');
  dbms_output.put('<th scope="col">Start Timestamp</th>');
  dbms_output.put('<th scope="col">End Timestamp</th>');
  dbms_output.put('<th scope="col">Days Old</th>');
  dbms_output.put_line('</tr>');
  OPEN owner_cursor;
  LOOP
    FETCH owner_cursor INTO current_owner_table;
    EXIT WHEN owner_cursor%NOTFOUND;

    sqlcmd := q'{WITH min_le_timestamp AS (SELECT MIN(le_timestamp) AS MinTime }'
    ||q'{FROM }'||current_owner_table||q'{), }'
    ||q'{max_le_timestamp AS (SELECT MAX(le_timestamp) AS MaxTime }'
    ||q'{FROM }'||current_owner_table||q'{) }'
    ||q'{SELECT MinTime, MaxTime, ROUND(SYSDATE - CAST(MinTime AS DATE)) Days_Old FROM min_le_timestamp, max_le_timestamp}';

    --dbms_output.put_line('<p>'||sqlcmd||'</p>');

    EXECUTE IMMEDIATE sqlcmd bulk collect INTO current_min_le_timestamp, current_max_le_timestamp, current_days_old;
    for i in 1..current_min_le_timestamp.count loop
        dbms_output.put('<tr><td>'||current_owner_table||'</td>'); 
        dbms_output.put('<td>'||current_min_le_timestamp(i)||'</td>');
        dbms_output.put('<td>'||current_max_le_timestamp(i)||'</td>');
        dbms_output.put('<td>'||current_days_old(i)||'</td>');
        dbms_output.put_line('</tr>');
    end loop;
  END LOOP;
  CLOSE owner_cursor;
  dbms_output.put_line('</table>');
  dbms_output.put_line('<br>');
  dbms_output.put_line('<br>');
END;
/

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Report on the oldest entry of each JMX database logging table. 
PRO This is done to check if LogTableCleaner is missing or failing to run. 
PRO See <a href="https://www.ptc.com/en/support/article/178198">CS178198</a> for details.</p>
PRO <p>Refer to <a href="https://www.ptc.com/en/support/article/CS44623">CS44623</a> for configured max age of each table.</p>

@@00_end.sql

/******** Standalone query ***********
WITH min_le_timestamp AS (SELECT MIN(le_timestamp) AS MinTime FROM PDM12.CACHESTATISTICS), 
max_le_timestamp AS (SELECT MAX(le_timestamp) AS MaxTime FROM PDM12.CACHESTATISTICS) 
SELECT MinTime, MaxTime, ROUND(SYSDATE - CAST(MinTime AS DATE)) Days_Old FROM min_le_timestamp, max_le_timestamp
;
*/