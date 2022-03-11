DEF title = 'Queue Entries (QUEUEENTRY)';
DEF filename = 'QueueEntry.html';
DEF nextpage = 'TablePreferences.html';
DEF prevpage = 'PerfTablesAge.html';
@@00_begin.sql

SET MARK HTML OFF;
PRO <br>
PRO <br>

SET TERMOUT OFF VER OFF FEEDBACK OFF;
SET SERVEROUTPUT ON SIZE 30000;

DECLARE
  CURSOR owner_cursor IS 
    SELECT owner FROM DBA_TABLES 
    WHERE table_name = 'QUEUEENTRY' and num_rows > 0 and owner IN (&&schema_list)
    ORDER BY owner;

   current_owner varchar2(128);
   sqlcmd varchar(1000);
   type qe_state_tab is table of varchar2(90);
   current_qe_state qe_state_tab;
   type q_name_tab is table of varchar2(90);
   current_q_name q_name_tab;
   type count_tab is table of number;
   current_count count_tab;
BEGIN
  OPEN owner_cursor;
  LOOP
    FETCH owner_cursor INTO current_owner;
    EXIT WHEN owner_cursor%NOTFOUND;
    dbms_output.put_line('<table class=sortable>');
    dbms_output.put('<tr><th scope="col">OWNER</th>');
    dbms_output.put('<th scope="col">QueueEntry State</th>');
    dbms_output.put('<th scope="col">Queue Name</th>');
    dbms_output.put_line('<th scope="col">Count</th></tr>');
    sqlcmd := q'{SELECT qe.codeC5 AS "QueueEntry State", }'
      ||q'{pq.name AS "Queue Name", }'
      ||q'{count(qe.idA2A2) AS "Count" }'
      ||q'{FROM }'||current_owner||q'{.QUEUEENTRY qe }'
      ||q'{INNER JOIN }'||current_owner||q'{.ProcessingQueue pq ON qe.idA3A5 = pq.idA2A2 }'
      ||q'{GROUP BY qe.codeC5, pq.name }'
      ||q'{ORDER BY "Count" DESC, "QueueEntry State"}';
    EXECUTE IMMEDIATE sqlcmd bulk collect INTO current_qe_state, current_q_name, current_count;
    for i in 1..current_qe_state.count loop
        dbms_output.put('<tr><td>'||current_owner||'</td>'); 
        dbms_output.put('<td>'||current_qe_state(i)||'</td>');
        dbms_output.put_line('<td>'||current_q_name(i)||'</td>');
        dbms_output.put_line('<td>'||current_count(i)||'</td></tr>');
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
PRO <p>High numbers of entries in a particular state generally indicate a problem.
PRO <p>Thousands of ready entries may indicate a queue is not processing.</p>

@@00_end.sql

/******** Standalone query ***********
SELECT qe.codeC5 AS "QueueEntry State", 
  pq.name AS "Queue Name", 
  count(qe.idA2A2) AS "Count"
FROM QueueEntry qe 
INNER JOIN ProcessingQueue pq ON qe.idA3A5 = pq.idA2A2 
GROUP BY qe.codeC5, pq.name 
ORDER BY "Count" DESC, "QueueEntry State";
*/