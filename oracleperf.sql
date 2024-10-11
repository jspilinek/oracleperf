-- oracleperf.sql by Jeremy Spilinek (jspilinek@ptc.com)
-- Based on gather_info_script.sql

DEF oracleperf_version = "v24.03"
DEF script_name = 'PTC Oracle Performance and Diagnostics Report &oracleperf_version';
DEF article_link = '<a href="https://www.ptc.com/en/support/article/CS271394">CS271394</a>';
DEF title = '&&script_name';
DEF mainPage = '00_oracleperf.html'

@@sql/00_ErrorCheck.sql

SET ECHO OFF;
SET TERMOUT OFF VERIFY OFF;
SET TRIMSPOOL ON;
SET HEADING ON;
SET ESCAPE ON;
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';

@@sql/00_values.sql
@@sql/00_ColumnFormat.sql

SET PAGESIZE 35;
SET LINESIZE 80;

SET TERMOUT ON VER OFF;
PRO Generating &&mainPage
SET TERMOUT OFF VER OFF;

SPOOL html/&&mainPage;

PRO <!DOCTYPE html>
PRO <html>
PRO <head>
PRO <title>&&title</title>
PRO <link rel="stylesheet" type="text/css" href="oracleperf.css">
PRO <script src="sorttable.js"></script>
PRO </head>
PRO <body>
PRO <h1>&&title &&article_link</h1>
PRO <p class="main-header">
PRO instance:<b class="main-header">&&instance_name</b>
PRO version:<b class="main-header">&&oracle_version</b>
PRO module:<b class="main-header">&&current_module</b>
PRO host:<b class="main-header">&&hostname</b>
PRO license:<b class="main-header">&&license_pack</b>
PRO days:<b class="main-header">&&days_up</b>
PRO generated:<b class="main-header">&&execute_time</b>
PRO </p>
PRO <p class="main-header">
PRO reported schema:<b class="main-header">&&schema_list</b>
PRO </p>

PRO <table class="main">
PRO <tr><td><ul>
PRO <li><a href="OracleVersion.html">Oracle Version</a></li>
PRO <li><a href="Schemas.html">Schemas</a></li>
PRO <li><a href="Exadata.html">Exadata</a></li>
PRO <li><a href="WindchillVersion.html">Windchill Version</a></li>
PRO <li><a href="WindchillVersionHistory.html">Windchill Version History</a></li>
PRO <li><a href="Uptime.html">Uptime</a></li>
PRO <li><a href="Instance.html">Instance</a></li>
PRO <li><a href="ImportantParam.html">Important Parameters</a></li>
PRO <li><a href="NonDefaultParam.html">Non-Default Parameters</a></li>
PRO <li><a href="ModifiedParam.html">Modified Parameters</a></li>
PRO <li><a href="AllParam.html">All Parameters</a></li>
PRO <br>
PRO <li><a href="OsStat.html">Operating System Statistics</a></li>
PRO <li><a href="OsMemory.html">Operating System Memory</a></li>
PRO <li><a href="TimeModel.html">Time Model Statistics</a></li>
PRO <li><a href="SystemStatistics.html">System Statistics</a></li>
PRO <br>
PRO <li><a href="SgaInfo.html">SGA Info</a></li>
PRO <li><a href="SgaTargetAdvice.html">SGA Target Advice</a></li>
PRO <li><a href="MemoryTargetAdvice.html">Memory Target Advice</a></li>
PRO <li><a href="DbCacheAdvice.html">DB Cache Advice</a></li>
PRO <li><a href="PgaTargetAdvice.html">PGA Target Advice</a></li>
PRO <li><a href="SharedPoolAdvice.html">Shared Pool Advice</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li><a href="CursorCheck.html">Cursor Check</a></li>
PRO <li><a href="ParseStatistics.html">Parse Statistics</a></li>
PRO <li><a href="ScalabilityInfo.html">Scalability Info</a></li>
PRO <br>
PRO <li><a href="RedoLogs.html">Redo Logs</a></li>
PRO <li><a href="Jobs.html">Jobs</a></li>
PRO <li><a href="SchedulerJobs.html">Scheduler Jobs</a></li>
PRO <li><a href="LogMode.html">Log Mode</a></li>
PRO <br>
PRO <li><a href="DiskIO.html">Disk I/O</a></li>
PRO <li><a href="FreeTablespace.html">Free Tablespace</a></li>
PRO <li><a href="TempTablespace.html">Temp Tablespace</a></li>
PRO <li><a href="Blobs.html">Blobs</a></li>
PRO <li><a href="UndoCheck.html">Undo Check</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li>Tables <a href="Tables.html">html</a> <a href="Tables.txt">txt</a></li>
PRO <li><a href="ChainedRows.html">Tables with Chained Rows</a></li>
PRO <li><a href="TableEmptySpace.html">Tables with Empty Space</a></li>
PRO <li><a href="TransientTables.html">Transient Tables</a></li>
PRO <li><a href="PerfTablesAge.html">Perf Tables Age</a></li>
PRO <li><a href="QueueEntry.html">Queue Entries</a></li>
PRO <li><a href="TablePreferences.html">Table Preferences</a></li>
PRO <li><a href="TableSampleSize.html">Table Sample Size</a></li>
PRO <li><a href="TableNullAnalyzed.html">Table Null Analyzed</a></li>
PRO <li><a href="TableStaleStats.html">Table Stale Stats</a></li>
PRO <li><a href="LockedStats.html">Locked Stats</a></li>
PRO <li><a href="TableDOP.html">Tables with DOP \&gt; 1</a></li>
PRO <li><a href="PctFree.html">Tables with PCT FREE \&lt;\&gt; 10</a></li>
PRO <br>
PRO <li>Indexes <a href="Indexes.html">html</a> <a href="Indexes.txt">txt</a></li>
PRO <li>Function Based Indexes <a href="FunctionIndexes.html">html</a> <a href="FunctionIndexes.txt">txt</a></li>
PRO <li><a href="InvalidIndexes.html">Invalid Indexes</a></li>
PRO <li><a href="TablesWithoutIndexes.html">Tables without Indexes</a></li>
PRO <li><a href="IdColumnNoIndexes.html">ID Columns without Indexes</a></li>
PRO <li><a href="IndexSampleSize.html">Index Sample Size</a></li>
PRO <li><a href="IndexNullAnalyzed.html">Index Null Analyzed</a></li>
PRO <li><a href="IndexStaleStats.html">Index Stale Stats</a></li>
PRO <br>
PRO <li>Columns <a href="Columns.html">html</a> <a href="Columns.txt">txt</a></li>
PRO <li><a href="ExtendedStatistics.html">Extended Statistics</a></li>
PRO <li><a href="FrequencyHistograms.html">Frequency Histograms</a></li>
PRO <li><a href="LongVarchar2Histograms.html">Long Varchar2 Histograms</a></li>
PRO <li><a href="ColumnSampleSize.html">Column Sample Size</a></li>
PRO <li><a href="ColumnNullAnalyzed.html">Column Null Analyzed</a></li>
PRO <br>
PRO <li>View Definitions <a href="ViewDefinitions.html">html</a> <a href="ViewDefinitions.txt">txt</a></li>
PRO <li>Triggers <a href="Triggers.html">html</a> <a href="Triggers.txt">txt</a></li>
PRO <li><a href="InvalidPackages.html">Invalid Packages</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li><a href="Waits.html">Wait Events</a></li>
PRO <li><a href="SegmentStatistics.html">Segment Statistics</a></li>
PRO <br>
PRO <li><a href="SqlByElapsedTime.html">Worst SQL by Elapsed Time</a></li>
PRO <li><a href="SqlByAverageElapsedTime.html">Worst SQL by Average Elapsed Time</a></li>
PRO <li><a href="SqlByBufferGets.html">Worst SQL By Buffer Gets</a></li>
PRO <li><a href="SqlByDiskReads.html">Worst SQL By Disk Reads</a></li>
PRO <li><a href="SqlByExecutionCount.html">Worst SQL By Execution Count</a></li>
PRO <li><a href="SqlByRowCount.html">Worst SQL By Row Count</a></li>
PRO <li><a href="DmlActivity.html">DML Activity</a></li>
PRO <li><a href="ActiveSql.html">Active SQL</a></li>
PRO <li><a href="BlockingSql.html">Blocking SQL</a></li>
PRO <li><a href="SqlLiterals.html">SQL Using Literals or Many Children</a></li>
PRO <br>
PRO <li><a href="SqlPlanBaselines.html">SQL Plan Baselines</a></li>
PRO <li>Full SQL Texts and Plans <a href="FullSqlTextAndPlans.html">html</a> <a href="FullSqlTextAndPlans.txt">txt</a></li>
PRO </ul></td>
PRO <td><ul>

SPOOL OFF

--Column 1
@@sql/OracleVersion.sql
@@sql/Schemas.sql
@@sql/Exadata.sql
@@sql/WindchillVersion.sql
@@sql/WindchillVersionHistory.sql
@@sql/Uptime.sql
@@sql/Instance.sql
@@sql/ImportantParam.sql
@@sql/NonDefaultParam.sql
@@sql/ModifiedParam.sql
@@sql/AllParam.sql

@@sql/OsStat.sql
@@sql/OsMemory.sql
@@sql/TimeModel.sql
@@sql/SystemStatistics.sql

@@sql/SgaInfo.sql
@@sql/SgaTargetAdvice.sql
@@sql/MemoryTargetAdvice.sql
@@sql/DbCacheAdvice.sql
@@sql/PgaTargetAdvice.sql
@@sql/SharedPoolAdvice.sql

--Column 2
@@sql/CursorCheck.sql
@@sql/ParseStatistics.sql
@@sql/ScalabilityInfo.sql

@@sql/RedoLogs.sql
@@sql/Jobs.sql
@@sql/SchedulerJobs.sql
@@sql/LogMode.sql

@@sql/DiskIO.sql
@@sql/FreeTablespace.sql
@@sql/TempTablespace.sql
@@sql/Blobs.sql
@@sql/UndoCheck.sql

--Column 3
@@sql/Tables.sql
@@sql/ChainedRows.sql
@@sql/TableEmptySpace.sql
@@sql/TransientTables.sql
@@sql/PerfTablesAge.sql
@@sql/QueueEntry.sql
@@sql/TablePreferences.sql
@@sql/TableSampleSize.sql
@@sql/TableNullAnalyzed.sql
@@sql/TableStaleStats.sql
@@sql/LockedStats.sql
@@sql/TableDOP.sql
@@sql/PctFree.sql

@@sql/Indexes.sql
@@sql/FunctionIndexes.sql
@@sql/InvalidIndexes.sql
@@sql/TablesWithoutIndexes.sql
@@sql/IdColumnNoIndexes.sql
@@sql/IndexSampleSize.sql
@@sql/IndexNullAnalyzed.sql
@@sql/IndexStaleStats.sql

@@sql/Columns.sql
@@sql/ExtendedStatistics.sql
@@sql/FrequencyHistograms.sql
@@sql/LongVarchar2Histograms.sql
@@sql/ColumnSampleSize.sql
@@sql/ColumnNullAnalyzed.sql

@@sql/ViewDefinitions.sql
@@sql/Triggers.sql
@@sql/InvalidPackages.sql

--Column 4
@@sql/Waits.sql
@@sql/SegmentStatistics.sql

@@sql/SqlByElapsedTime.sql
@@sql/SqlByAverageElapsedTime.sql
@@sql/SqlByBufferGets.sql
@@sql/SqlByDiskReads.sql
@@sql/SqlByExecutionCount.sql
@@sql/SqlByRowCount.sql
@@sql/DmlActivity.sql
@@sql/ActiveSql.sql
@@sql/BlockingSql.sql
@@sql/SqlLiterals.sql

@@sql/SqlPlanBaselines.sql
--FullSqlTextAndPlans.sql will run after AWR section

--Column 5
@@sql/99_Column5_AWR.sql

--Run this query last
@@sql/FullSqlTextAndPlans.sql

SET TERMOUT OFF;
SPOOL html/&&mainPage APPEND
PRO </ul></td></tr></table>
@@sql/00_footer.sql
SPOOL OFF;

COL script_end NEW_VALUE script_end;
SELECT LTRIM((TO_CHAR(SYSDATE,'J') + TO_CHAR(SYSDATE,'SSSSS') - &&script_start)) AS script_end FROM DUAL;

SET TERMOUT ON;
SET VERIFY ON;
SET TRIMSPOOL OFF;

PRO 
PRO oracleperf.sql completed in &&script_end seconds.
