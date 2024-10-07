select *
from dba_hist_sql_plan
where sql_id = '&&enteredSQLID'
order by plan_hash_value, id ASC;
