DEF title = 'Table Null Analyzed (dba_tables)';
DEF filename = 'TableNullAnalyzed.html';
DEF nextpage = 'TableStaleStats.html';
DEF prevpage = 'TableSampleSize.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>LAST_ANALYZED is NULL:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/TableNullAnalyzed.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check for tables that do not have statistics. This is a rare problem as Oracle generates
PRO statistics automatically. Generally happens after a database import and statistics were not
PRO included.</p>

@@00_end.sql
