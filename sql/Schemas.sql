DEF title = 'Schemas';
DEF filename = 'Schemas.html';
DEF nextpage = 'Exadata.html';
DEF prevpage = 'OracleVersion.html';
@@00_begin.sql

SET MARK HTML OFF;
PRO <p>
PRO oracleperf.sql script recieved the schema input: <b class="main-header">&&enteredSchema</b>
PRO </p><p>
PRO The Oracle report was generated for the following schemas: <b class="main-header">&&schema_list</b>
PRO </p>

PRO List of all schemas in the database:
SET MARKUP HTML ON TABLE "class=sortable";
@@sql/sub/Schemas.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>List all schemas incase something was ignored</p>
PRO <p>When entered schema is <b class="main-header">ALL</b> then ignore schemas that have WBM tables</p>
PRO <p>The following schema names are ignored automatically:</p>
PRO <table>
PRO <tr><td>ACT_RMAN_USER</td></tr>
PRO <tr><td>ANONYMOUS</td></tr>
PRO <tr><td>APEX_030200</td></tr>
PRO <tr><td>APEX_040200</td></tr>
PRO <tr><td>APEX_PUBLIC_USER</td></tr>
PRO <tr><td>APPQOSSYS</td></tr>
PRO <tr><td>AUDSYS</td></tr>
PRO <tr><td>BI</td></tr>
PRO <tr><td>CLOUDCTL_USER</td></tr>
PRO <tr><td>CTXSYS</td></tr>
PRO <tr><td>DBSFWUSER</td></tr>
PRO <tr><td>DBSNMP</td></tr>
PRO <tr><td>DIP</td></tr>
PRO <tr><td>DMSYS</td></tr>
PRO <tr><td>DVF</td></tr>
PRO <tr><td>DVSYS</td></tr>
PRO <tr><td>EXFSYS</td></tr>
PRO <tr><td>FLOWS_FILES</td></tr>
PRO <tr><td>GGSYS</td></tr>
PRO <tr><td>GSMADMIN_INTERNAL</td></tr>
PRO <tr><td>GSMCATUSER</td></tr>
PRO <tr><td>GSMUSER</td></tr>
PRO <tr><td>HR</td></tr>
PRO <tr><td>IX</td></tr>
PRO <tr><td>LBACSYS</td></tr>
PRO <tr><td>MDDATA</td></tr>
PRO <tr><td>MDSYS</td></tr>
PRO <tr><td>MGMT_VIEW</td></tr>
PRO <tr><td>ODM</td></tr>
PRO <tr><td>ODM_MTR</td></tr>
PRO <tr><td>OE</td></tr>
PRO <tr><td>OJVMSYS</td></tr>
PRO <tr><td>OLAPSYS</td></tr>
PRO <tr><td>ORACLE_OCM</td></tr>
PRO <tr><td>ORDDATA</td></tr>
PRO <tr><td>ORDPLUGINS</td></tr>
PRO <tr><td>ORDSYS</td></tr>
PRO <tr><td>OUTLN</td></tr>
PRO <tr><td>OWBSYS</td></tr>
PRO <tr><td>OWBSYS_AUDIT</td></tr>
PRO <tr><td>PM</td></tr>
PRO <tr><td>QS</td></tr>
PRO <tr><td>QS_CBADM</td></tr>
PRO <tr><td>QS_CS</td></tr>
PRO <tr><td>QS_ES</td></tr>
PRO <tr><td>QS_OS</td></tr>
PRO <tr><td>QS_WS</td></tr>
PRO <tr><td>REMOTE_SCHEDULER_AGENT</td></tr>
PRO <tr><td>SCOTT</td></tr>
PRO <tr><td>SH</td></tr>
PRO <tr><td>SI_INFORMTN_SCHEMA</td></tr>
PRO <tr><td>SPATIAL_CSW_ADMIN_USR</td></tr>
PRO <tr><td>SPATIAL_WFS_ADMIN_USR</td></tr>
PRO <tr><td>SQLTXADMIN</td></tr>
PRO <tr><td>SQLTXPLAIN</td></tr>
PRO <tr><td>SYS</td></tr>
PRO <tr><td>SYS$UMF</td></tr>
PRO <tr><td>SYSBACKUP</td></tr>
PRO <tr><td>SYSDG</td></tr>
PRO <tr><td>SYSKM</td></tr>
PRO <tr><td>SYSMAN</td></tr>
PRO <tr><td>SYSRAC</td></tr>
PRO <tr><td>SYSTEM</td></tr>
PRO <tr><td>TSMSYS</td></tr>
PRO <tr><td>WKSYS</td></tr>
PRO <tr><td>WMSYS</td></tr>
PRO <tr><td>XDB</td></tr>
PRO <tr><td>XS$NULL</td></tr>
PRO </table>

@@00_end.sql
