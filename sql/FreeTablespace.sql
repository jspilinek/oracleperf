DEF title = 'Check Free Space in each tablespace';
DEF filename = 'FreeTablespace.html';
DEF nextpage = 'TempTablespace.html';
DEF prevpage = 'DiskIO.html';
@@00_begin.sql

@@sql/sub/FreeTablespace.sql
@@sql/sub/DataFiles.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>An opportunity to alert admins to impending key tablespaces running out of space.</p> 
PRO Generally a tablespace should be increased when <b>%Free</b> < 10% or <b>Free(MB)</b> < 100 MB.</p>
PRO <p>SYSTEM and SYSAUX tablespaces can generally be ignored as these system tablespaces rarely change.</p>

@@00_end.sql
