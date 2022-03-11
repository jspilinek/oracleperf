SET MARK HTML ON TABLE "class=sortable";
with total_segment_scans as (select sum(value) as sum_value
from v$segment_statistics
where statistic_name = 'segment scans'
and object_type NOT IN ('INDEX', 'INDEX PARTITION')
group by statistic_name)
select * from 
(select ss.owner, ss.tablespace_name, ss.object_name, ss.subobject_name, ss.object_type, lob.table_name as lob_table_name,
ss.value as segment_scans,
round(ss.value/t.sum_value*100,2) as "% of Total"
from v$segment_statistics ss
left join DBA_LOBS lob on lob.segment_name = ss.object_name, 
total_segment_scans t
where ss.statistic_name = 'segment scans'
and ss.object_type NOT IN ('INDEX', 'INDEX PARTITION')
and value > &&seg_limit
order by segment_scans desc)
where rownum <= &&top_seg;
