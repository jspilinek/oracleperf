DEF title = 'Function Based Indexes (dba_indexes)';
DEF filename = 'FunctionIndexes.html';
DEF nextpage = 'InvalidIndexes.html';
DEF prevpage = 'Indexes.html';
@@00_begin.sql

@@sql/sub/FunctionIndexes.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Consider the existing indexes and their column order when deciding on how (and if) to add 
PRO indexes to try and improve the performance of a SQL statement.</p>
PRO <p>It can be helpful to have the SQL to be tuned and the existing indexes for the tables in 
PRO the SQL statement on a screen together to avoid having to switch back and forth.</p>
PRO <p>Note of caution, some systems have multiple schemas with the same tables and indexes, be 
PRO sure to use the indexes from the correct schema.  Determining the correct schema can be done a 
PRO couple of ways:</p>
PRO <ol><li>using the db.property wt.pom.dbUser</li>
PRO <li>using the owner column from the a SQL report (below)</li>
PRO <li>a non-reliable way but will sometimes work is to look at the row counts of different tables 
PRO from the table report (or use the report showing tables with more than 10 000 rows).  The one 
PRO with the highest row counts is the production schema.</li></ol>

@@00_end.sql


--**********************************************************************************************
--**********************************************************************************************
DEF filename = 'FunctionIndexes.txt';
--**********************************************************************************************
--**********************************************************************************************

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SET LINESIZE 380
SET PAGESIZE 75

SPOOL html/&&filename REPLACE

@@sql/sub/FunctionIndexes.sql

@@00_txtFooter.sql

SPOOL OFF
SET PAGESIZE 35
