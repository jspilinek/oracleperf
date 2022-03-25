DEF title = 'Columns (dba_tab_columns dba_tables)';
DEF filename = 'Columns.html';
DEF nextpage = 'ExtendedStatistics.html';
DEF prevpage = 'IndexStaleStats.html';

@@00_begin.sql

@@sql/sub/Columns.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Used for SQL tuning:</p>
PRO <ul><li>Determine if a new index should be created</li>
PRO <li>Verify <b>Sample Percent</b> is not too low</li>
PRO <li>Confirm column statistics agree with index statistics</li></ul>
PRO <p>Also used for advanced analysis not covered in the above examples</p>
PRO <p>This report does not include empty tables or columns with only NULL values</p>
PRO <p><b>Sample Percent</b> is calculated as NUM_ROWS/(SAMPLE_SIZE - NUM_NULLS)</p>

@@00_end.sql


--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'Columns.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 310
SET PAGESIZE 75

SPOOL html/&&filename REPLACE

@@sql/sub/Columns.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
