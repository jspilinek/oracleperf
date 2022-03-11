DEF title = 'ID columns without an index (dba_indexes)';
DEF filename = 'IdColumnNoIndexes.html';
DEF nextpage = 'IndexSampleSize.html';
DEF prevpage = 'TablesWithoutIndexes.html';
@@00_begin.sql

@@sql/sub/IdColumnNoIndexes.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>The results of this report should not be the basis of adding indexes. Adding indexes based on this report
PRO will result in unnecessary indexes (and their overhead) being made.</p>

@@00_end.sql
