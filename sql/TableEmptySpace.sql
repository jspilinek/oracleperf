DEF title = 'Tables that have more than 1000 MB of empty space (dba_tables)';
DEF filename = 'TableEmptySpace.html';
DEF nextpage = 'TransientTables.html';
DEF prevpage = 'ChainedRows.html';
@@00_begin.sql

@@sql/sub/TableEmptySpace.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Tables with a lot of unused space are candidates to rebuilt, the space reclaimed which can 
PRO improve performance.</p>
PRO <p>See <a href="https://support.ptc.com/appserver/cs/view/solution.jsp?n=CS295223">CS295223</a> 
PRO for instructions to rebuild the QueueEntry table.</p>

@@00_end.sql
