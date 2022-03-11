DEF title = 'Time Model Statistics (V$SYS_TIME_MODEL)';
DEF filename = 'TimeModel.html';
DEF nextpage = 'SystemStatistics.html';
DEF prevpage = 'OsMemory.html';
@@00_begin.sql

@@sql/sub/DbTime.sql
@@sql/sub/TimeModel.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Aggregated time spent in the database by operation type.</p>
SET MARK HTML ON TABLE "class=sortable";

@@sql/sub/TimeModelType.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Another view showing the hierarchy of the operation types.</p>

@@00_end.sql
