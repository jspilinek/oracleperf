DEF title = 'Worst SQL by Row Count per Execution (V$SQLSTATS)';
DEF filename = 'SqlByRowCount.html';
DEF nextpage = 'DmlActivity.html';
DEF prevpage = 'SqlByExecutionCount.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByRowCount.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>This report can be used to identify SQL statements which could be responsible for causing Out of Memory Errors
PRO in the method server.  Can also serve as an indication as to wether the site would benefit from setting
PRO the db.property wt.pom.queryLimit to reduce the number of rows a method server will accept from Oracle.
PRO Many site benefit from having this property set.</p>

@@00_end.sql
