DEF title = 'dba_hist_sqlstat';
DEF filename = 'dba_hist_sqlstat.html';
DEF nextpage = '&&mainPage';
DEF prevpage = 'dba_hist_sql_plan_formatted.html';
@@sql/00_begin.sql


SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sqlid/sub/dba_hist_sqlstat.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>

@@sql/00_end.sql
