select /*gather_info_script*/ * from (
  select '<a href="FullSqlTextAndPlans.html#'||a.sql_id||'">'||a.sql_id||'</a>' as SQL_ID,
    c.username,
    a.disk_reads,
    round((a.disk_reads/total_reads.sumed)*100,2) "% Total Reads",
    a.executions,
    round(a.disk_reads/nvl(nullif(a.executions,0),1)) as Reads_per_Exec,
    a.buffer_gets,
    round(a.elapsed_time/1000000) as elapsed_time_secs,
    round(a.user_io_wait_time/1000000) as user_io_wait_time,
    b.sql_text
  from v$sqlstats a, v$sqltext b,dba_users c, v$sqlarea d,
  (select sum(disk_reads) sumed from v$sqlstats) total_reads
  where a.sql_id=b.sql_id
    and a.plan_hash_value=d.plan_hash_value
    and a.sql_id=d.sql_id
    and c.user_id=d.parsing_user_id 
    and a.sql_id not in (select t.sql_id from v$sqltext t where t.piece = 0 and t.sql_text like 'DECLARE /*gather_info_script*/%')
    and b.piece=0
    and a.disk_reads > 10000
  order by disk_reads desc, Reads_per_Exec desc)
where rownum <= 100 -- get top 100
order by rownum asc
;
