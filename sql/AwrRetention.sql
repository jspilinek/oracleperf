DEF title = 'AWR Retention (DBA_HIST_WR_CONTROL)';
DEF filename = 'AwrRetention.html';
DEF nextpage = '00_oracleperf.html';
DEF prevpage = 'SqlPlanBaselines.html';
@@00_begin.sql

@@sql/sub/AwrRetention.sql

SET MARKUP HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Defaults:</p>
PRO <ul><li>SNAP_INTERVAL = 1 hour</li>
PRO <li>RETENTION = 8 days</li></ul>

@@00_end.sql

SPOOL html/00_oracleperf.html APPEND;
PRO <br>
PRO <li><a href="AwrRetention.html">AWR Retention</a></li>
PRO <br>
SPOOL OFF;