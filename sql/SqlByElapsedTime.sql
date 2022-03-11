DEF title = 'Worst SQL by Elapsed Time (V$SQLSTATS)';
DEF filename = 'SqlByElapsedTime.html';
DEF nextpage = 'SqlByAverageElapsedTime.html';
DEF prevpage = 'SegmentStatistics.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByElapsedTime.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>This is one the most important sections in the report.
PRO Most systems usually have a small number of SQL statements which use more resources and are cumulatively
PRO responsible for disproportionate load on the database. One of the main goals in tuning Oracle is to
PRO reduce the load these statements cause.  One way to identify these top resource consuming SQL is
PRO by cumulative elapsed time.</p>
PRO <p>Columns definitions:</p>
PRO <p><b>SQL_ID</b> The unique identifier of the statement.</p>
PRO <p><b>USERNAME</b> The database username executing the statement.</p>
PRO <p><b>CPU_TIME_SECS</b> Time the SQL statement spent executing on the CPU.</p>
PRO <p><b>ELAPSED_TIME_SECS</b> Total time SQL spent executing, the difference between this and CPU_TIME_SECS is approximate wait for the statement</p>
PRO <p><b>ELAP_PER_EXEC</b> Calculated as ELAPSED_TIME_SECS/EXECUTIONS, high ELAPSED_TIME_SECS value but low per execution time may not be worth tuning.</p>
PRO <p><b>EXECUTIONS</b> Number of times a SQL statement was executed.</p>
PRO <p><b>ROWS_PROCESSED</b> Total number of rows returned for all statements; rows returned may vary per execution.</p>
PRO <p>When the most costly SQL statements have been identified it can make analysis easier to copy
PRO the SQL statement to a text file and reformat it and look for tuning opportunities.  Checking 
PRO that columns in the "WHERE" clause are indexed is the first step (markForDeleteA2 should never 
PRO be indexed). Tuning SQL statements is beyond the scope of this document.</p>

@@00_end.sql
