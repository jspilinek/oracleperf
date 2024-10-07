DEF title = 'sqlstat (v$sqlstat)';
DEF filename = 'sqlstat.html';
DEF nextpage = 'sqlstat_by_child.html';
DEF prevpage = '&&mainPage';
@@sql/00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Total:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_total.sql

SET MARK HTML OFF;
PRO <h2>Per Execution:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_per_exec.sql

SET MARK HTML OFF;
PRO <h2>Physical:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_physical.sql

SET MARK HTML OFF;
PRO <h2>Extra:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sqlid/sub/sqlstat_extra.sql

-- SET MARK HTML OFF;
-- PRO <h2>Comments</h2>
-- PRO <p></p>

@@sql/00_end.sql
