select /*gather_info_script*/ * from (
  select '<a href="FullSqlTextAndPlans.html#'||a.sql_id||'">'||a.sql_id||'</a>' as SQL_ID,
    c.parsing_schema_name as OWNER,
    a.executions,
    a.rows_processed,
    round(a.rows_processed/nvl(nullif(a.executions,0),1)) rows_per_exec,
    b.sql_text
  from v$sqlstats a, v$sqltext b, v$sqlarea c
  where a.sql_id=b.sql_id
    and a.plan_hash_value=c.plan_hash_value
    and a.sql_id=c.sql_id
    and b.piece=0
    and a.rows_processed > 200000
  order by rows_per_exec desc)
where rownum <= 100 -- get top 100
order by rownum asc
;
