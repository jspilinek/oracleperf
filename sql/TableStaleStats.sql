DEF title = 'Table Stale Statistics (dba_tab_statistics dba_tab_modifications)';
DEF filename = 'TableStaleStats.html';
DEF nextpage = 'LockedStats.html';
DEF prevpage = 'TableNullAnalyzed.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Stale table statistics:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/TableStaleStats.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics are considered stale when 10% of the rows have been modified.</p>

@@00_end.sql
