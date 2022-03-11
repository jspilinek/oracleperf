select name,value 
from v$sysstat 
where name like '%cursors current%'
OR name like '%session cursor cache hits';
