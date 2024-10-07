SPOOL html/Plans.txt APPEND;
SELECT * FROM TABLE(dbms_xplan.display_cursor('&1',&2,format=>'+outline +PEEKED_BINDS'));

SPOOL html/Plans.html APPEND;
SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
-- PRO </b><pre class="plan&3">
SET MARKUP HTML ON PREFORMAT ON ENTMAP ON;
SELECT * FROM TABLE(dbms_xplan.display_cursor('&1',&2,format=>'+outline +PEEKED_BINDS'));
SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
