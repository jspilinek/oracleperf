DEF title = 'SQL Using Literals or Many Children (GV$SQL GV$SQLAREA)';
DEF filename = 'SqlLiterals.html';
DEF nextpage = 'SqlPlanBaselines.html';
DEF prevpage = 'BlockingSql.html';

@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>SQL using literals or many children:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/SqlLiterals.sql

SET MARK HTML OFF;
PRO <h2>Child cursor count:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/ChildCursor.sql

SET MARK HTML OFF;
PRO <h2>Check how many SQL in the library cache are for dynamic sampling:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/DynamicSampling.sql

@@00_end.sql
