DEF title = 'Index Null Analyzed (dba_indexes)';
DEF filename = 'IndexNullAnalyzed.html';
DEF nextpage = 'IndexStaleStats.html';
DEF prevpage = 'IndexSampleSize.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>LAST_ANALYZED is NULL:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/IndexNullAnalyzed.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check for indexes that do not have statistics. This is a rare problem as Oracle generates
PRO statistics automatically. Generally happens after a database import and statistics were not
PRO included.</p>

@@00_end.sql
