-- sqlid.sql by Jeremy Spilinek (jspilinek@ptc.com)
-- Report on a single SQLID

DEF oracleperf_version = "v24.02"
DEF script_name = 'SQLID Report &oracleperf_version';
DEF article_link = '<a href="https://www.ptc.com/en/support/article/CS271394">CS271394</a>';
DEF title = '&&script_name';
DEF mainPage = '00_sqlid.html'

@@sql/00_ErrorCheck.sql

SET ECHO OFF;
SET TERMOUT OFF VERIFY OFF;
SET TRIMSPOOL ON;
SET HEADING ON;
SET ESCAPE ON;
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';

@@sql/00_values.sql
@@sql/sqlid/00_sqlid.sql
@@sql/00_ColumnFormat.sql

SET PAGESIZE 35;
SET LINESIZE 80;

SET TERMOUT ON VER OFF;
PRO Generating &&mainPage
SET TERMOUT OFF VER OFF;

SPOOL html/&&mainPage;

PRO <!DOCTYPE html>
PRO <html>
PRO <head>
PRO <title>&&enteredSQLID &&title</title>
PRO <link rel="stylesheet" type="text/css" href="oracleperf.css">
PRO <script src="sorttable.js"></script>
PRO </head>
PRO <body>
PRO <h1>&&enteredSQLID &&title</h1>
PRO <p class="main-header">
PRO instance:<b class="main-header">&&instance_name</b>
PRO version:<b class="main-header">&&oracle_version</b>
PRO module:<b class="main-header">&&current_module</b>
PRO host:<b class="main-header">&&hostname</b>
PRO license:<b class="main-header">&&license_pack</b>
PRO days:<b class="main-header">&&days_up</b>
PRO generated:<b class="main-header">&&execute_time</b>
PRO </p>
PRO <p class="main-header">
PRO reported schema:<b class="main-header">&&schema_list</b>
PRO </p>

PRO <table class="main">
PRO <tr><td><ul>
PRO <li><a href="sqlstat.html">v$sqlstat</a></li>
PRO <li><a href="sqlstat_by_child.html">SQL Stats by Child</a></li>
PRO <li><a href="sqlarea.html">v$sqlarea</a></li>
PRO <li><a href="sqltext.txt">SQL Text</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li><a href="activeSQLID.html">Active SQLID</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li>Plans <a href="Plans.html">html</a> <a href="Plans.txt">txt</a></li>
PRO </ul></td>
PRO <td><ul>
PRO <li><a href="dba_hist_sql_plan.html">dba_hist_sql_plan</a></li>
PRO <li><a href="dba_hist_sql_plan_formatted.html">Formatted dba_hist_sql_plan</a></li>
PRO <br>
PRO <li><a href="dba_hist_sqlstat.html">dba_hist_sqlstat</a></li>
PRO </ul></td>

SPOOL OFF

--Column 1
@@sql/sqlid/sqlstat.sql
@@sql/sqlid/sqlstat_by_child.sql
@@sql/sqlid/sqlarea.sql
@@sql/sqlid/sqltext.sql

--Column 2
@@sql/sqlid/activeSQLID.sql

--Column 3
@@sql/sqlid/Plans.sql

--Column 4
@@sql/sqlid/dba_hist_sql_plan.sql
@@sql/sqlid/dba_hist_sql_plan_formatted.sql
@@sql/sqlid/dba_hist_sqlstat.sql

--Column 5

COL script_end NEW_VALUE script_end;
SELECT LTRIM((TO_CHAR(SYSDATE,'J') + TO_CHAR(SYSDATE,'SSSSS') - &&script_start)) AS script_end FROM DUAL;

SET TERMOUT ON;
SET VERIFY ON;
SET TRIMSPOOL OFF;

PRO 
PRO sqlid.sql completed in &&script_end seconds.
