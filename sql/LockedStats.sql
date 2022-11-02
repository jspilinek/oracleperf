DEF title = 'Locked stats (dba_tab_statistics)';
DEF filename = 'LockedStats.html';
DEF nextpage = 'TableDOP.html';
DEF prevpage = 'TableStaleStats.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>stattype_locked IS NOT NULL:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/LockedStats.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics with a low sample size might cause performance issues.</p>

@@00_end.sql
