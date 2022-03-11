DEF title = 'Scalability Info (V$SQLSTATS)';
DEF filename = 'ScalabilityInfo.html';
DEF nextpage = 'RedoLogs.html';
DEF prevpage = 'ParseStatistics.html';
@@00_begin.sql

@@sql/sub/ScalabilityInfo.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>The difference between <b>CPU_TIME_SECS</b> and <b>ELAPSED_TIME_SECS</b> is the amount of 
PRO waiting which occurred and the cost of this wait. Ideally there would be very little difference
PRO between the two numbers (<b>%CPU</b> near 100), but realistically there generally always will
PRO be. When the elapsed time is more than double the CPU time the overhead is significant and 
PRO needs to be addressed.</p>
PRO <p><b>DISK_READS</b> should be much lower than <b>BUFFER_GETS</b> (<b>%DISK</b> near 0). A high
PRO <b>%DISK</b> indicates there is too many physical reads from disk. Generally this would be
PRO addressed by tuning the worst SQL and/or adding memory to the SGA.</p>

@@00_end.sql