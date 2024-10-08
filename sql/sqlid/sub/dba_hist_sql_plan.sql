select *
from dba_hist_sql_plan
where sql_id = '&&enteredSQLID'
order by dbid, plan_hash_value, id ASC;
