DEF title = 'Triggers (dba_triggers)';
DEF filename = 'Triggers.html';
DEF nextpage = 'InvalidPackages.html';
DEF prevpage = 'ViewDefinitions.html';
@@00_begin.sql

@@sql/sub/Triggers.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Used when tuning SQL involving triggers. Generally ignorable. Used for advanced analysis.</p>

@@00_end.sql

--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'Triggers.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 450
SET LONG 20000

SPOOL html/&&filename REPLACE

@@sql/sub/Triggers.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
