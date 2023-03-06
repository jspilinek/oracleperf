with total_db_block_changes as (select sum(value) as sum_value
from v$segment_statistics
where statistic_name = 'db block changes'
group by statistic_name)
select * from 
(select ss.owner, ss.tablespace_name, ss.object_name, ss.subobject_name, ss.object_type, 
lob.table_name as lob_table_name, lob.column_name as lob_column_name,
ss.value as db_block_changes,
round(ss.value/t.sum_value*100,2) as "% of Total"
from v$segment_statistics ss
left join DBA_LOBS lob on lob.segment_name = ss.object_name, 
total_db_block_changes t
where ss.statistic_name = 'db block changes'
and value > &&seg_limit
order by db_block_changes desc)
where rownum <= &&top_seg;
