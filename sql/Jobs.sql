DEF title = 'Jobs (DBA_JOBS)';
DEF filename = 'Jobs.html';
DEF nextpage = 'SchedulerJobs.html';
DEF prevpage = 'RedoLogs.html';
@@00_begin.sql

@@sql/sub/Jobs.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>List all jobs in the database. Generally ignorable.</p>

@@00_end.sql
