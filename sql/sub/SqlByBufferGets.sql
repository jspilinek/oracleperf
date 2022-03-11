select /*gather_info_script*/ * from (
  select '<a href="FullSqlTextAndPlans.html#'||a.sql_id||'">'||a.sql_id||'</a>' as SQL_ID,
    c.username,
    a.buffer_gets,
    round((a.buffer_gets/total_reads.sumed)*100,2) "% Total Gets",
    a.executions,
    round(a.buffer_gets/nvl(nullif(a.executions,0),1)) as Gets_per_Exec,
    a.disk_reads,
    round(a.elapsed_time/1000000,3) as elapsed_time_secs,
    round(a.user_io_wait_time/1000000,3) as user_io_wait_time,
    b.sql_text
  from v$sqlstats a, v$sqltext b,dba_users c, v$sqlarea d,
  (select sum(buffer_gets) sumed from v$sqlstats) total_reads
  where a.sql_id=b.sql_id
    and a.plan_hash_value=d.plan_hash_value
    and a.sql_id=d.sql_id
    and c.user_id=d.parsing_user_id 
    and a.sql_id not in (select t.sql_id from v$sqltext t where t.piece = 0 and t.sql_text like '%/*gather_info_script*/%')
    and b.piece=0
    and a.buffer_gets > 10000
  order by buffer_gets desc, Gets_per_Exec desc)
where rownum <= 100 -- get top 100
order by rownum asc
;
