select /*gather_info_script*/ * from (
  select '<a href="FullSqlTextAndPlans.html#'||a.sql_id||'">'||a.sql_id||'</a>' as SQL_ID,
    c.username, 
    round(a.elapsed_time/1000000,3) as elapsed_time_secs,
    round(a.cpu_time/1000000,3) as cpu_time_secs,
    round(a.elapsed_time/1000000/nvl(nullif(a.executions,0),1),3) as Elap_per_Exec,
    a.executions,
    a.rows_processed,
    b.sql_text,
    TO_CHAR(a.last_active_time, 'YYYY-MM-DD HH24:MI:SS') AS last_active_time,
    a.parse_calls,
    a.disk_reads,
    a.direct_writes,
    a.buffer_gets,
    a.serializable_aborts,
    a.fetches,
    a.end_of_fetch_count,
    a.loads,
    a.version_count,
    a.invalidations,
    a.sorts,
    a.sharable_mem,
    a.total_sharable_mem,
    round(a.application_wait_time/1000000) as application_wait_time,
    round(a.concurrency_wait_time/1000000) as concurrency_wait_time,
    round(a.cluster_wait_time/1000000) as cluster_wait_time,
    round(a.user_io_wait_time/1000000) as user_io_wait_time,
    round(a.plsql_exec_time/1000000) as plsql_exec_time
  from v$sqlstats a, v$sqltext b,dba_users c, v$sqlarea d
  where a.sql_id=b.sql_id
    and a.plan_hash_value=d.plan_hash_value
    and a.sql_id=d.sql_id
    and c.user_id=d.parsing_user_id 
    and a.sql_id not in (select t.sql_id from v$sqltext t where t.piece = 0 and t.sql_text like '%/*gather_info_script*/%')
    and b.piece=0
    and a.elapsed_time > 10000000 -- nothing less than 10 sec
  order by a.elapsed_time desc, Elap_per_Exec desc)
where rownum <= 100 -- get top 100
order by rownum asc
;