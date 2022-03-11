DEF title = 'Index Stale Statistics (dba_ind_statistics)';
DEF filename = 'IndexStaleStats.html';
DEF nextpage = 'Columns.html';
DEF prevpage = 'IndexNullAnalyzed.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Stale index statistics:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/IndexStaleStats.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics are considered stale when 10% of the rows have been modified.</p>

@@00_end.sql
