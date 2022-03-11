DEF title = 'Parse Statistics (V$SYSSTAT)';
DEF filename = 'ParseStatistics.html';
DEF nextpage = 'ScalabilityInfo.html';
DEF prevpage = 'CursorCheck.html';
@@00_begin.sql

@@sql/sub/ParseStatistics.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>It is rare to need this information. Target is 100% for each parse statistic, but is
PRO typically lower for Windchill.</p>

@@00_end.sql