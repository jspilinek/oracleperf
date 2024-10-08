DEF title = 'dba_hist_sql_plan';
DEF filename = 'dba_hist_sql_plan.html';
DEF nextpage = 'dba_hist_sql_plan_formatted.html';
DEF prevpage = 'Plans.html';
@@sql/00_begin.sql


SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sqlid/sub/dba_hist_sql_plan.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>

@@sql/00_end.sql
