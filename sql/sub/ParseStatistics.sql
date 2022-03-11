select 'Soft Parse ' "Ratio"
,round(
((select sum(value) from v$sysstat where name = 'parse count (total)')
- (select sum(value) from v$sysstat where name = 'parse count (hard)'))
/(select sum(value) from v$sysstat where name = 'parse count (total)')
*100,2)||'%' "percentage"
from dual
union
select 'Parse CPU to Parse Elapsd ' "Ratio"
,round(
(select sum(value) from v$sysstat where name = 'parse time cpu')
/(select sum(value) from v$sysstat where name = 'parse time elapsed')
*100,2)||'%' "percentage"
from dual
union
select 'Execute to Parse ' "Ratio"
,round(
((select sum(value) from v$sysstat where name = 'execute count')
- (select sum(value) from v$sysstat where name = 'parse count (total)'))
/(select sum(value) from v$sysstat where name = 'execute count')
*100,2)||'%' "percentage"
from dual;
