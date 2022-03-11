with total_physical_read_requests as (select sum(value) as sum_value
from v$segment_statistics
where statistic_name = 'physical read requests'
group by statistic_name)
select * from 
(select ss.owner, ss.tablespace_name, ss.object_name, ss.subobject_name, ss.object_type, lob.table_name as lob_table_name,
ss.value as physical_read_requests,
round(ss.value/t.sum_value*100,2) as "% of Total"
from v$segment_statistics ss
left join DBA_LOBS lob on lob.segment_name = ss.object_name, 
total_physical_read_requests t
where ss.statistic_name = 'physical read requests'
and value > &&seg_limit
order by physical_read_requests desc)
where rownum <= &&top_seg;
