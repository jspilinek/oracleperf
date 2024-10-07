DEF title = 'SQL stats by child (v$sql)';
DEF filename = 'sqlstat_by_child.html';
DEF nextpage = 'sqlarea.html';
DEF prevpage = 'sqlstat.html';
@@sql/00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Total:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_by_child_total.sql

SET MARK HTML OFF;
PRO <h2>Per Execution:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_by_child_per_exec.sql

SET MARK HTML OFF;
PRO <h2>Physical:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_by_child_physical.sql

SET MARK HTML OFF;
PRO <h2>Extra:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_by_child_extra.sql

-- SET MARK HTML OFF;
-- PRO <h2>Comments</h2>
-- PRO <p></p>

@@sql/00_end.sql
