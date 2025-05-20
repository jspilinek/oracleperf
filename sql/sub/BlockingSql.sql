select s1.username || '@' || s1.machine || '(SID=' || s1.sid || ' Serial=' || s1.serial# || ' Status=' || s1.status || ')' as blocker,
s2.username || '@' || s2.machine || ' (SID=' || s2.sid || ' Serial=' || s2.serial# || ' Status=' || s2.status  || ')' as waiter,
l2.ctime as seconds, s2.wait_class, l2.type as lock_type, 
sqla1.sql_id as Blocker_SQL_ID, sqla1.SQL_FULLTEXT as Blocker_SQL, 
sqla2.sql_id as Waiter_SQL_ID,sqla2.SQL_FULLTEXT as Waiter_SQL, 
s1.program as blocker_program, s1.wait_class as blocker_wait, s1.event as blocker_event,
sqla3.sql_id as Blocker_Prev_SQL_ID, sqla3.SQL_FULLTEXT as blocker_prev_SQL
from gv$lock l1, gv$session s1, gv$lock l2, gv$session s2, gv$sqlarea sqla1, gv$sqlarea sqla2, gv$sqlarea sqla3
where s1.sid=l1.sid and s2.sid=l2.sid
and l1.BLOCK=1 and l2.request > 0
and l1.id1 = l2.id1
and l1.id2 = l2.id2
and s1.sql_hash_value = sqla1.hash_value(+) and s1.sql_address = sqla1.address(+)
and s2.sql_hash_value = sqla2.hash_value(+) and s2.sql_address = sqla2.address(+)
and s1.prev_hash_value = sqla3.hash_value(+) and s1.prev_sql_addr = sqla3.address(+)
order by seconds desc;
