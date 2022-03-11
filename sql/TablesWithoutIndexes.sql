DEF title = 'Tables without indexes (dba_tables dba_ind_columns)';
DEF filename = 'TablesWithoutIndexes.html';
DEF nextpage = 'IdColumnNoIndexes.html';
DEF prevpage = 'InvalidIndexes.html';
@@00_begin.sql

@@sql/sub/TablesWithoutIndexes.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Used to check if there are tables without indexes. Could be an indication of a missed installation step or a failed install.</p> 
PRO <p>Could also happen when a table is dropped (along with its indexes) and the table was restored from backup, but the indexes were not recreated. For example:</p>
PRO <ol><li>Backup table created:
PRO <br>SELECT * FROM EPMDocument INTO EPMDOCUMENT_BAK;</li>
PRO <li>Original table dropped (resulting in indexes dropped):
PRO <br>DROP TABLE EPMDocument;</li>
PRO <li>Table restored from backup without indexes:
PRO <br>SELECT * FROM EPMDOCUMENT_BAK INTO EPMDocument;</li></ol>
PRO <p>Can ignore backup tables (tableName_BAK, tableName_Date, etc.) and tables with zero rows. 
PRO Probably can also ignore tables with fewer than 1000 rows.</p>

@@00_end.sql
