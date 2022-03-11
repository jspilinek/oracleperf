DEF title = 'View Definitions (dba_views)';
DEF filename = 'ViewDefinitions.html';
DEF nextpage = 'Triggers.html';
DEF prevpage = 'ColumnNullAnalyzed.html';
@@00_begin.sql

@@sql/sub/ViewDefinitions.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Used when tuning SQL involving views. Generally ignorable. Used for advanced analysis.</p>
PRO <p>Note TEXT is limited to first 80 characters. Refer to <a href="ViewDefinitions.txt">ViewDefinitions.txt</a> for full TEXT.</p>

@@00_end.sql

--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'ViewDefinitions.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 420
SET LONG 20000

SPOOL html/&&filename REPLACE

@@sql/sub/ViewDefinitions.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
