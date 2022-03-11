DEF title = 'Log Mode (V$DATABASE)';
DEF filename = 'LogMode.html';
DEF nextpage = 'DiskIO.html';
DEF prevpage = 'SchedulerJobs.html';
@@00_begin.sql

@@sql/sub/LogMode.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check if <b>LOG_MODE</b> is <b>ARCHIVELOG</b> or <b>NOARCHIVELOG</b> mode.</p>
PRO <b>LOG_MODE</b> should be set to <b>ARCHIVELOG</b> for combined cold, hot and incremental
PRO backups. Refer to <a href="http://support.ptc.com/WCMS/files/95703/en/BackupRecoveryTechBrief.pdf">
PRO Windchill Backup and Recovery Planning</a> technical brief for details.</p>
PRO See also <a href="https://docs.oracle.com/cd/E11882_01/server.112/e25494/archredo.htm#ADMIN008">
PRO Managing Archived Redo Logs</a> in Oracle 11g Database Administrator Guide</p>

@@00_end.sql
