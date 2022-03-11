DEF title = 'Tables (dba_tables)';
DEF filename = 'Tables.html';
DEF nextpage = 'ChainedRows.html';
DEF prevpage = 'UndoCheck.html';

@@00_begin.sql

@@sql/sub/Tables.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Sort by <b>NUM_ROWS</b> column to determine the largest tables in the database.</p>
PRO <p>Sort by <b>SAMPLE_PERCENT</b> column to check if tables have a low sample size.</p>
PRO <p>If there are no entries in the <b>NUM_ROWS BLOCKS AVG_ROW_LEN CHAIN_CNT LAST_ANALYZED</b> columns this means
PRO statistics have not been gathered for the schema and must be as the next thing that is done. There is no
PRO point in doing any more tuning until the statistics are up to date.</p>

@@00_end.sql


--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'Tables.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 245
SET PAGESIZE 75

SPOOL html/&&filename REPLACE

@@sql/sub/Tables.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
