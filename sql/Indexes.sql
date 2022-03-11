DEF title = 'Indexes (dba_indexes)';
DEF filename = 'Indexes.html';
DEF nextpage = 'FunctionIndexes.html';
DEF prevpage = 'PctFree.html';


@@00_begin.sql

@@sql/sub/Indexes.sql

@@00_end.sql


--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'Indexes.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 380
SET PAGESIZE 75

SPOOL html/&&filename REPLACE

@@sql/sub/Indexes.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
