DEF title = 'Invalid Indexes (dba_indexes)';
DEF filename = 'InvalidIndexes.html';
DEF nextpage = 'TablesWithoutIndexes.html';
DEF prevpage = 'FunctionIndexes.html';
@@00_begin.sql

@@sql/sub/InvalidIndexes.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Indexes returned here need to be "rebuilt".</p>
PRO <p>Sample syntax: <b>alter index index_name rebuild;</b></p>

@@00_end.sql
