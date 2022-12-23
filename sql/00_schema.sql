SET FEEDBACK OFF;
SET TERMOUT ON VER OFF;

PRO Enter schema name to generate report for or enter ALL to report on all schemas:
COL enteredSchema NEW_V enteredSchema FOR A40;
SELECT NVL(UPPER(TRIM('&1.')), '?') enteredSchema FROM DUAL;
PRO You entered &&enteredSchema
WHENEVER SQLERROR EXIT SQL.SQLCODE;
BEGIN
  IF '&&enteredSchema.' = '?' THEN
    RAISE_APPLICATION_ERROR(-20000, '"&&enteredSchema." is not a valid entry');
  END IF;
END;
/
WHENEVER SQLERROR CONTINUE;

SET TERMOUT OFF VER OFF;

COL valid_schema_list NEW_VALUE valid_schema_list;
SELECT listagg('''' || username || '''', ',') within group (order by username) AS valid_schema_list 
    FROM DBA_USERS
    WHERE username NOT IN 
    (
    'ACT_RMAN_USER',
    'ANONYMOUS',
    'APEX_030200',
    'APEX_040200',
    'APEX_PUBLIC_USER',
    'APPQOSSYS',
    'AUDSYS',
    'BI',
    'CLOUDCTL_USER',
    'CTXSYS',
    'DBSFWUSER',
    'DBSNMP',
    'DIP',
    'DMSYS',
    'DVF',
    'DVSYS',
    'EXFSYS',
    'FLOWS_FILES',
    'GGSYS',
    'GSMADMIN_INTERNAL',
    'GSMCATUSER',
    'GSMUSER',
    'HR',
    'IX',
    'LBACSYS',
    'MDDATA',
    'MDSYS',
    'MGMT_VIEW',
    'ODM',
    'ODM_MTR',
    'OE',
    'OJVMSYS',
    'OLAPSYS',
    'ORACLE_OCM',
    'ORDDATA',
    'ORDPLUGINS',
    'ORDSYS',
    'OUTLN',
    'OWBSYS',
    'OWBSYS_AUDIT',
    'PM',
    'QS',
    'QS_CBADM',
    'QS_CS',
    'QS_ES',
    'QS_OS',
    'QS_WS',
    'REMOTE_SCHEDULER_AGENT',
    'SCOTT',
    'SH',
    'SI_INFORMTN_SCHEMA',
    'SPATIAL_CSW_ADMIN_USR',
    'SPATIAL_WFS_ADMIN_USR',
    'SQLTXADMIN',
    'SQLTXPLAIN',
    'SYS',
    'SYS$UMF',
    'SYSBACKUP',
    'SYSDG',
    'SYSKM',
    'SYSMAN',
    'SYSRAC',
    'SYSTEM',
    'TSMSYS',
    'WKSYS',
    'WMSYS',
    'XDB',
    'XS$NULL');

COL schema_list NEW_VALUE schema_list;
SELECT CASE '&&enteredSchema'
  WHEN 'ALL' THEN (SELECT listagg('''' || username || '''',',') within group (order by username) AS schemas FROM DBA_USERS WHERE username IN (&&valid_schema_list)
  AND username NOT IN (SELECT owner FROM DBA_TABLES WHERE table_name = 'WBMDBTYPE'))
  ELSE (SELECT '''' || username || '''' AS schemas FROM DBA_USERS WHERE username = '&&enteredSchema' AND username IN (&&valid_schema_list))
END AS schema_list FROM DUAL;

COL schema_count_found NEW_VALUE schema_count_found;
SELECT CASE '&&enteredSchema'
  WHEN 'ALL' THEN (SELECT COUNT(1) FROM DBA_USERS WHERE username IN (&&valid_schema_list)
  AND username NOT IN (SELECT owner FROM DBA_TABLES WHERE table_name = 'WBMDBTYPE'))
  ELSE (SELECT COUNT(1) FROM DBA_USERS WHERE username = '&&enteredSchema' AND username IN (&&valid_schema_list))
END AS schema_count_found FROM DUAL;

SET TERMOUT ON VER OFF;
WHENEVER SQLERROR EXIT SQL.SQLCODE;
BEGIN
  IF &&schema_count_found < 1 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Entered schema name "&&enteredSchema." was not found');
  END IF;
END;
/
WHENEVER SQLERROR CONTINUE;

-- SET TERMOUT ON VER OFF;
-- PRO enteredSchema: &&enteredSchema
-- PRO schema_list: &&schema_list
-- PRO valid_schema_list: &&valid_schema_list
-- PRO schema_count_found: &&schema_count_found
SET TERMOUT OFF VER OFF;
/
