with total_logical_reads as (select sum(value) as sum_value
from V$SEGMENT_STATISTICS
where statistic_name = 'logical reads'
group by statistic_name)
select * from 
(select ss.owner, ss.tablespace_name, ss.object_name, ss.subobject_name, ss.object_type, 
lob.table_name as lob_table_name, lob.column_name as lob_column_name,
ss.value as logical_reads,
round(ss.value/t.sum_value*100,2) as "% of Total"
from V$SEGMENT_STATISTICS ss
left join DBA_LOBS lob on lob.segment_name = ss.object_name, 
total_logical_reads t
where ss.statistic_name = 'logical reads'
and value > &&seg_limit
order by logical_reads desc)
where rownum <= &&top_seg;
