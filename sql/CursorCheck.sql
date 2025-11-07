DEF title = 'Cursor Check (V$SYSSTAT V$SGASTAT)';
DEF filename = 'CursorCheck.html';
DEF nextpage = 'ParseStatistics.html';
DEF prevpage = 'PdbInfo.html';
@@00_begin.sql

@@sql/sub/CursorCheck.sql
@@sql/sub/LargePool.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>It is rare to need this information. It can be useful for open cursor problems 
PRO and other unusual shared pool related problems.</p>

@@00_end.sql