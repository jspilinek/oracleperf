DEF title = 'Scheduler Jobs (DBA_SCHEDULER_JOBS)';
DEF filename = 'SchedulerJobs.html';
DEF nextpage = 'LogMode.html';
DEF prevpage = 'Jobs.html';
@@00_begin.sql

@@sql/sub/SchedulerJobs.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>List all scheduler jobs in the database. Generally ignorable.</p>

@@00_end.sql
