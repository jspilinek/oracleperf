DEF title = 'Redo Logs (dba_tables)';
DEF filename = 'RedoLogs.html';
DEF nextpage = 'Jobs.html';
DEF prevpage = 'ScalabilityInfo.html';
@@00_begin.sql

@@sql/sub/Logfile.sql
@@sql/sub/Log.sql
@@sql/sub/LogGroups.sql
@@sql/sub/LogHistory.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Last chart is the log switches per hour for the last three weeks. Ideally there should be at
PRO most 2-3 log switches per hour. The exception would be during a bulk load. Log switches in the
PRO double digits can indicate the redo logs are too small (check the <b>MB</b> column in the second chart)</p>
PRO <p>Note: Amazon RDS sets <b>archive_lag_target=300</b> to force log switches every five minutes. 
PRO This is done to guarantee 5 minute backup frequency.</p>

@@00_end.sql
