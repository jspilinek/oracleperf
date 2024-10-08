DEF title = 'Active SQLID (GV$SESSION GV$SQLTEXT)';
DEF filename = 'activeSQLID.html';
DEF nextpage = 'Plans.html';
DEF prevpage = 'sqltext.txt';
@@sql/00_begin.sql


SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sqlid/sub/activeSQLID.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check if SQLID &&enteredSQLID is currently executing</p>

@@sql/00_end.sql
