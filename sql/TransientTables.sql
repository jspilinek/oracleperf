DEF title = 'Transient Tables (dba_tables)';
DEF filename = 'TransientTables.html';
DEF nextpage = 'PerfTablesAge.html';
DEF prevpage = 'TableEmptySpace.html';
@@00_begin.sql

@@sql/sub/TransientTables.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Tables that hold transient data and may grow to certain size causing performance problems.</p>
PRO <p>Report is limited to tables with >= 500 blocks.</p>
PRO <p>Check for tables with very high row count (may need to be manually cleaned up)</p>
PRO <p>Check for tables with low row count, but high blocks count (may need to be shrunk)</p>

@@00_end.sql
