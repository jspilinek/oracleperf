DEF title = 'Plans (v$sql_plan)';
DEF filename = 'Plans.html';
DEF nextpage = 'dba_hist_sql_plan.html';
DEF prevpage = 'activeSQLID.html';
@@sql/00_begin.sql

SPOOL html/Plans.txt REPLACE;
SPOOL OFF;
SET HEADING OFF;
SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
SPOOL sql/99_plans.sql REPLACE;

select '@sql/sqlid/display_cursor.sql &&enteredSQLID '||child_number 
from v$sql_plan
WHERE sql_id = '&&enteredSQLID'
AND id = 0
ORDER BY child_number ASC;

SPOOL html/Plans.html APPEND;
@@sql/99_plans.sql;

SPOOL OFF;
SET HEADING ON;

@@sql/00_end.sql
