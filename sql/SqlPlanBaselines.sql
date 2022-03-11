DEF title = 'SQL Plan Baselines (DBA_SQL_PLAN_BASELINES)';
DEF filename = 'SqlPlanBaselines.html';
DEF nextpage = 'FullSqlTextAndPlans.html';
DEF prevpage = 'SqlLiterals.html';
@@00_begin.sql

@@sql/sub/BaselineCount.sql
@@sql/sub/SqlPlanBaselines.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Output limited to top 100 baselines by last_executed</p>

@@00_end.sql
