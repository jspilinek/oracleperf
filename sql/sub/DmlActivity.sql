select /*gather_info_script*/ * from (
select SQL_ID, username, LAST_LOAD_TIME,EXECUTIONS,SQL_TEXT from v$sql, dba_users
where 
(upper(SQL_TEXT) like '%INSERT%'
or upper(SQL_TEXT) like '%DELETE%'  
or upper(SQL_TEXT) like '%UPDATE%'
or upper(SQL_TEXT) like '%DBMS_LOB.WRITE%')
and upper(SQL_TEXT) not like '%SELECT%'
and dba_users.user_id=v$sql.PARSING_USER_ID 
order by EXECUTIONS desc)
where rownum <= 20
order by rownum asc
;
