select name,value as Cursors
from v$sysstat 
where name like '%cursors current%'
OR name like '%session cursor cache hits';
