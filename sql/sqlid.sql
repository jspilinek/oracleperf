SET TERMOUT ON;
PRO Adding &1 to FullSqlTextAndPlans.txt and FullSqlTextAndPlans.html
SET TERMOUT OFF;

SET LINESIZE 500;
SET VERIFY OFF;
SET FEEDBACK OFF;
SET HEADING ON;
SET PAGESIZE 0 EMBEDDED ON;
SET SERVEROUTPUT ON SIZE UNLIMITED;
SET TRIMSPOOL ON;

SPOOL html/FullSqlTextAndPlans.txt APPEND;
PRO '****************************************************************************************************'

/****** Total Stats ******/
PRO Total Stats (v$sqlstats):
SELECT sql_id, 
  SUM(executions) AS executions, 
  ROUND(SUM(elapsed_time)/1000000, 3) AS ElapsedTimeSec, 
  ROUND(SUM(elapsed_time)/1000000/NVL(NULLIF(SUM(executions),0),1),3) AS elaps_per_exec, 
  ROUND(SUM(buffer_gets)/nvl(nullif(SUM(executions),0),1)) AS buffer_gets_per_exec, 
  ROUND(SUM(disk_reads)/nvl(nullif(SUM(executions),0),1)) AS disk_reads_per_exec, 
  ROUND(SUM(rows_processed)/nvl(nullif(SUM(executions),0),1)) AS rows_per_exec,
  ROUND(SUM(application_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS app_wait_per_exec,
  ROUND(SUM(concurrency_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS concur_wait_per_exec,
  ROUND(SUM(cluster_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS cluster_wait_per_exec,
  ROUND(SUM(user_io_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS io_wait_per_exec,
  SUM(buffer_gets) AS buffer_gets, 
  SUM(disk_reads) AS disk_reads, 
  SUM(rows_processed) AS rows_processed,
  SUM(application_wait_time) AS application_wait_time,
  SUM(concurrency_wait_time) AS concurrency_wait_time,
  SUM(cluster_wait_time) AS cluster_wait_time,
  SUM(user_io_wait_time) AS user_io_wait_time
FROM v$sqlstats
WHERE sql_id = '&1'
GROUP BY sql_id;

--Blank line
PRO

/****** Child cursor stats ******/
PRO Child cursor stats (v$sql):
SELECT a.child_number,
    a.plan_hash_value,
    a.parsing_schema_name,
    round(a.elapsed_time/1000000,3) as elapsed_time_secs,
    round(a.cpu_time/1000000,3) as cpu_time_secs,
    round(a.elapsed_time/1000000/nvl(nullif(a.executions,0),1),3) as Elap_per_Exec,
    a.executions,
    a.rows_processed,
    TO_CHAR(a.last_active_time, 'YYYY-MM-DD HH24:MI:SS') AS last_active_time,
    a.parse_calls,
    a.disk_reads,
    a.direct_writes,
    a.buffer_gets,
    a.serializable_aborts,
    a.fetches,
    a.end_of_fetch_count,
    a.loads,
    -- a.version_count,
    a.invalidations,
    a.sorts,
    a.sharable_mem,
    -- a.total_sharable_mem,
    round(a.application_wait_time/1000000,3) as application_wait_time,
    round(a.concurrency_wait_time/1000000,3) as concurrency_wait_time,
    round(a.cluster_wait_time/1000000,3) as cluster_wait_time,
    round(a.user_io_wait_time/1000000,3) as user_io_wait_time,
    round(a.plsql_exec_time/1000000,3) as plsql_exec_time
  from v$sql a
  where a.sql_id= '&1'
order by a.elapsed_time desc, Elap_per_Exec desc;

--Blank line
PRO

SELECT sql_text FROM v$sqltext WHERE sql_id ='&1' ORDER BY piece;

--Blank line
PRO

SPOOL OFF;
SET HEADING OFF;
SPOOL sql/99_plans.sql REPLACE;

/****** Get top plans by elapsed_time ******/
-- Both of the below queries do the same thing, not sure if one performs better than the other
/*
With MaxTime as (
SELECT plan_hash_value, child_number, elapsed_time,
  max(elapsed_time) Over (Partition by plan_hash_value) max_elapsed_time
FROM 
(SELECT a.child_number, a.plan_hash_value, a.elapsed_time
  from v$sql a, v$sql_plan b
  where a.sql_id= '5zmr1b0un44wh'
  and b.id=0
   and a.sql_id=b.sql_id
   and a.child_number=b.child_number
   and a.address=b.address
   and a.hash_value=b.hash_value)
)
SELECT plan_hash_value, child_number, elapsed_time
FROM MaxTime
WHERE elapsed_time = max_elapsed_time
ORDER BY elapsed_time DESC;

SELECT plan_hash_value,
  max(child_number) keep (dense_rank first order by elapsed_time desc) as child_number,
  max(elapsed_time) as elapsed_time
FROM (
SELECT a.child_number, a.plan_hash_value, a.elapsed_time
  from v$sql a, v$sql_plan b
  where a.sql_id= '5zmr1b0un44wh'
  and b.id=0
   and a.sql_id=b.sql_id
   and a.child_number=b.child_number
   and a.address=b.address
   and a.hash_value=b.hash_value
)
group by plan_hash_value
ORDER BY elapsed_time DESC;
*/

With MaxTime as (
SELECT plan_hash_value, child_number, elapsed_time,
  max(elapsed_time) Over (Partition by plan_hash_value) max_elapsed_time
FROM 
(SELECT a.child_number, a.plan_hash_value, a.elapsed_time
  from v$sql a, v$sql_plan b
  where a.sql_id= '&1'
  and b.id=0
   and a.sql_id=b.sql_id
   and a.child_number=b.child_number
   and a.address=b.address
   and a.hash_value=b.hash_value)
)
SELECT '@sql/display_cursor.sql &1 '||child_number||' '||rownum FROM (
SELECT child_number
FROM MaxTime
WHERE elapsed_time = max_elapsed_time
ORDER BY elapsed_time DESC)
WHERE rownum <= &TopPlans;

-- SPOOL html/FullSqlTextAndPlans.txt APPEND;

-- @sql/99_plans.sql

SPOOL OFF;

/********************** HTML OUTPUT BELOW ***************************/
-- SET TERMOUT ON;
-- PRO Adding &1 to FullSqlTextAndPlans.html
-- SET TERMOUT OFF;

SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;

SPOOL html/FullSqlTextAndPlans.html APPEND;

PRO <hr>
PRO <h2 id="&1">SQL_ID: <b>&1</b></h2>

/****** Total Stats ******/
PRO Total Stats (v$sqlstats):
-- PRO </p>
SET MARKUP HTML ON TABLE "class=sortable"  PREFORMAT OFF ENTMAP OFF;
SET HEADING ON;
SET PAGESIZE 5000;
SELECT sql_id, 
  SUM(executions) AS executions, 
  ROUND(SUM(elapsed_time)/1000000, 3) AS ElapsedTimeSec, 
  ROUND(SUM(elapsed_time)/1000000/NVL(NULLIF(SUM(executions),0),1),3) AS elaps_per_exec, 
  ROUND(SUM(buffer_gets)/nvl(nullif(SUM(executions),0),1)) AS buffer_gets_per_exec, 
  ROUND(SUM(disk_reads)/nvl(nullif(SUM(executions),0),1)) AS disk_reads_per_exec, 
  ROUND(SUM(rows_processed)/nvl(nullif(SUM(executions),0),1)) AS rows_per_exec,
  ROUND(SUM(application_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS app_wait_per_exec,
  ROUND(SUM(concurrency_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS concur_wait_per_exec,
  ROUND(SUM(cluster_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS cluster_wait_per_exec,
  ROUND(SUM(user_io_wait_time)/1000000/nvl(nullif(SUM(executions),0),1),3) AS io_wait_per_exec,
  SUM(buffer_gets) AS buffer_gets, 
  SUM(disk_reads) AS disk_reads, 
  SUM(rows_processed) AS rows_processed,
  SUM(application_wait_time) AS application_wait_time,
  SUM(concurrency_wait_time) AS concurrency_wait_time,
  SUM(cluster_wait_time) AS cluster_wait_time,
  SUM(user_io_wait_time) AS user_io_wait_time
FROM v$sqlstats
WHERE sql_id = '&1'
GROUP BY sql_id;

SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
PRO </p></p>

/****** Child cursor stats ******/
SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
PRO Child cursor stats (v$sql):
SET MARKUP HTML ON TABLE "class=sortable"  PREFORMAT OFF ENTMAP OFF;
SELECT a.child_number,
    a.plan_hash_value,
    a.parsing_schema_name,
    round(a.elapsed_time/1000000,3) as elapsed_time_secs,
    round(a.cpu_time/1000000,3) as cpu_time_secs,
    round(a.elapsed_time/1000000/nvl(nullif(a.executions,0),1),3) as Elap_per_Exec,
    a.executions,
    a.rows_processed,
    TO_CHAR(a.last_active_time, 'YYYY-MM-DD HH24:MI:SS') AS last_active_time,
    a.parse_calls,
    a.disk_reads,
    a.direct_writes,
    a.buffer_gets,
    a.serializable_aborts,
    a.fetches,
    a.end_of_fetch_count,
    a.loads,
    -- a.version_count,
    a.invalidations,
    a.sorts,
    a.sharable_mem,
    -- a.total_sharable_mem,
    round(a.application_wait_time/1000000,3) as application_wait_time,
    round(a.concurrency_wait_time/1000000,3) as concurrency_wait_time,
    round(a.cluster_wait_time/1000000,3) as cluster_wait_time,
    round(a.user_io_wait_time/1000000,3) as user_io_wait_time,
    round(a.plsql_exec_time/1000000,3) as plsql_exec_time
  from v$sql a
  where a.sql_id= '&1'
order by a.elapsed_time desc, Elap_per_Exec desc;

SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
PRO </p></p><b>

--PRO <p>---------- Full SQL Text (v$sqltext) ----------</p>
SET MARKUP HTML ON PREFORMAT ON ENTMAP ON;
SET HEADING OFF;
SELECT sql_text FROM v$sqltext WHERE sql_id ='&1' ORDER BY piece;

/****** Top Plans ******/
SET MARKUP HTML OFF PREFORMAT OFF ENTMAP OFF;
PRO </b>
@sql/99_plans.sql

SPOOL OFF;
SET MARKUP HTML OFF;
