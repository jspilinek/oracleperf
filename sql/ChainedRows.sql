DEF title = 'Tables with Chained Rows (dba_tables)';
DEF filename = 'ChainedRows.html';
DEF nextpage = 'TableEmptySpace.html';
DEF prevpage = 'Tables.html';
@@00_begin.sql

@@sql/sub/ChainedRows.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Too many chained rows can cause performance problems.</p>
PRO <p>Addressing chained rows is not usually the answer to a problem, but it can be one of the 
PRO steps to address a problem. Generally rebuild consider rebuilding tables to address this.</p>
PRO <p>The syntax to address a table is the same as the syntax to rebuild the "QueueEntry" table 
PRO with a different table name and an unknown number of indexes.</p>
PRO <p>See <a href="https://support.ptc.com/appserver/cs/view/solution.jsp?n=CS295223">CS295223</a> 
PRO for instructions to rebuild the QueueEntry table.</p>

@@00_end.sql
