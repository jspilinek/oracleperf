-- Test if we're using SQL*Plus. SQL Developer is not supported. Unknown if this works with other clients (e.g. Toad)
SET TERMOUT OFF VER OFF;
COL current_module NEW_VALUE current_module FOR A48;
SELECT SYS_CONTEXT('USERENV','MODULE') current_module FROM DUAL;

WHENEVER SQLERROR EXIT SQL.SQLCODE;
BEGIN
    IF '&&current_module.' = 'SQL Developer' THEN
        RAISE_APPLICATION_ERROR(-20000, 'SQL Developer is not supported. Please execute oracleperf.sql in SQL*Plus.');
    END IF;
END;
/
WHENEVER SQLERROR CONTINUE;

-- Test if sql and sql/sub scripts are accessible
SET TERMOUT ON VER OFF;
WHENEVER OSERROR EXIT 'Failed to locate <oracleperf-&oracleperf_version>/sql/00_test1.sql';
@@sql/00_test1.sql
WHENEVER OSERROR EXIT 'Failed to locate <oracleperf-&oracleperf_version>/sql/sub/00_test2.sql';
@@sql/sub/00_test2.sql
WHENEVER OSERROR CONTINUE;

-- Test if user has access to V$INSTANCE
SET TERMOUT ON VER OFF;
WHENEVER SQLERROR EXIT 'Unable to access V$INSTANCE. This can happen if oracleperf.sql script was run as Windchill db user. This script requires system, sysdba, or any user with access to DBA tables';
SELECT instance_name FROM V$INSTANCE;
WHENEVER SQLERROR CONTINUE;
