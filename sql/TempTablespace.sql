DEF title = 'Check Free Space in Temp Tablespace';
DEF filename = 'TempTablespace.html';
DEF nextpage = 'Blobs.html';
DEF prevpage = 'FreeTablespace.html';
@@00_begin.sql

@@sql/sub/TempTablespace.sql
@@sql/sub/TempFile.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>An opportunity to alert admins to impending temp tablespace running out of space.</p> 
PRO <p>Can be useful for diagnosing <i>ORA-01652: unable to extend temp segment by 128 in tablespace TEMP</i></p>

@@00_end.sql
