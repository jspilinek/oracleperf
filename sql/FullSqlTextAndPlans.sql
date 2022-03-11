DEF title = 'Full SQL Text and Plans';
DEF filename = '99_FullSqlTextAndPlans.sql';
DEF nextpage = '00_oracleperf.html';
DEF prevpage = 'SqlPlanDirectives.html';

SET TERMOUT OFF;

SET HEADING OFF;
SET PAGESIZE 0;
SET TRIMSPOOL ON;
SET FEEDBACK OFF;
SET LINESIZE 250;

DEFINE TopNumber = 100;
DEFINE TopPlans = 3;

/****** Reset files ******/
SPOOL html/FullSqlTextAndPlans.txt REPLACE;
SPOOL html/FullSqlTextAndPlans.html REPLACE;
PRO <!DOCTYPE html>
PRO <html>
PRO <head>
PRO <title>&&title</title>
PRO <link rel="stylesheet" type="text/css" href="oracleperf.css">
PRO </head>
PRO <body>
PRO <h1>&&title</h1>
PRO <hr>
PRO <br>
PRO <a href="00_oracleperf.html">Back to main page</a>
SPOOL OFF;

/****** Generate list of SQL_IDs ******/
SET TERMOUT ON;
PRO Generating list of SQL IDs
SET TERMOUT OFF;
SPOOL sql/99_full.sql REPLACE;

WITH sqlstats AS (
SELECT sql_id, 
  SUM(executions) AS executions, 
  SUM(elapsed_time) AS elapsed_time, 
  ROUND(SUM(elapsed_time)/1000000/NVL(NULLIF(SUM(executions),0),1),3) AS elaps_per_exec, 
  SUM(buffer_gets) AS buffer_gets, 
  SUM(disk_reads) AS disk_reads, 
  SUM(rows_processed) AS rows_processed/*,
  SUM(application_wait_time) AS application_wait_time,
  SUM(concurrency_wait_time) AS concurrency_wait_time,
  SUM(cluster_wait_time) AS cluster_wait_time,
  SUM(user_io_wait_time) AS user_io_wait_time*/
FROM v$sqlstats
WHERE sql_text NOT LIKE 'SELECT /* DS_SVC */%'
AND sql_text NOT LIKE '/* SQL Analyze(%'
AND sql_text NOT LIKE '%/*gather_info_script*/%'
GROUP BY sql_id
),
--#########################################
top_elapsed_time AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE elapsed_time > 10000000 -- nothing less than 10 sec
  ORDER BY elapsed_time DESC)
WHERE rownum <= &TopNumber),
--#########################################
top_elap_per_exec AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE elaps_per_exec >= 1 -- nothing less than 1 sec
  ORDER BY elaps_per_exec DESC)
WHERE rownum <= &TopNumber),
--#########################################
top_buffer_gets AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE buffer_gets > 10000
  ORDER BY buffer_gets DESC)
WHERE rownum <= &TopNumber),
--#########################################
top_disk_reads AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE disk_reads > 10000
  ORDER BY disk_reads DESC)
WHERE rownum <= &TopNumber),
--#########################################
top_executions AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE executions > 1000
  ORDER BY executions DESC)
WHERE rownum <= &TopNumber),
--#########################################
top_rows_per_exec AS (
SELECT sql_id, elapsed_time FROM (
  SELECT sql_id, elapsed_time
  FROM sqlstats
  WHERE rows_processed > 200000
  ORDER BY rows_processed/NVL(NULLIF(executions,0),1) DESC)
WHERE rownum <= &TopNumber)
--#########################################
SELECT '@sql/sqlid.sql '||sql_id--, 
FROM (
  SELECT sql_id, elapsed_time FROM top_elapsed_time 
  UNION SELECT sql_id, elapsed_time FROM top_elap_per_exec 
  UNION SELECT sql_id, elapsed_time FROM top_buffer_gets 
  UNION SELECT sql_id, elapsed_time FROM top_disk_reads 
  UNION SELECT sql_id, elapsed_time FROM top_executions 
  UNION SELECT sql_id, elapsed_time FROM top_rows_per_exec)
ORDER BY elapsed_time DESC;

SPOOL OFF;
SET HEADING ON;
SET PAGESIZE 0 EMBEDDED ON;

/****** Generate FullSqlTextAndPlans.txt and FullSqlTextAndPlans.html ******/
@sql/99_full.sql

/****** End of file ******/
SPOOL html/FullSqlTextAndPlans.html APPEND;
@@00_end.sql

SET PAGESIZE 35;
SET TERMOUT ON;
PRO Done!