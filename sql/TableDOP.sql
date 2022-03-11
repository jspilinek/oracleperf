DEF title = 'Tables with DOP \&gt; 1 (dba_tables)';
DEF filename = 'TableDOP.html';
DEF nextpage = 'PctFree.html';
DEF prevpage = 'LockedStats.html';

@@00_begin.sql

@@sql/sub/TableDOP.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check for tables that have Degree of Parallelism (DOP) set higher than 1 (default).</p>
PRO <p>Generally this is ignorable. Useful if parallelism is suspected as causing issues. Make sure to also check <b>parallel_*</b> parameters</p>

@@00_end.sql
