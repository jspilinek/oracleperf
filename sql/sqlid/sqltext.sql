DEF title = 'SQL Text (v$sqltext)';
DEF filename = 'sqltext.txt';

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 245
SET PAGESIZE 75

SPOOL html/&&filename REPLACE

@@sql/sqlid/sub/sqltext.sql

@@sql/00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
