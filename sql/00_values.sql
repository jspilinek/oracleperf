@@sql/00_schema.sql
@@sql/00_license.sql

COL script_start NEW_VALUE script_start;
SELECT TO_CHAR(SYSDATE,'J') + TO_CHAR(SYSDATE,'SSSSS') AS script_start FROM DUAL;

COL instance_name NEW_VALUE instance_name FOR A16;
SELECT instance_name AS instance_name FROM V$INSTANCE;

COL oracle_version NEW_VALUE oracle_version FOR A17;
SELECT version AS oracle_version FROM V$INSTANCE;

COL hostname NEW_VALUE hostname FOR A64;
SELECT host_name AS hostname FROM V$INSTANCE;

COL days_up NEW_VALUE days_up FOR A3;
SELECT TO_CHAR(ROUND(SYSDATE - MIN(logon_time))) AS days_up FROM V$SESSION;

COL execute_time NEW_VALUE execute_time FOR A20;
SELECT TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss') execute_time FROM DUAL;

COL current_module NEW_VALUE current_module FOR A48;
SELECT SYS_CONTEXT('USERENV','MODULE') current_module FROM DUAL;
