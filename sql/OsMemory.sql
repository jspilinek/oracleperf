DEF title = 'Operating System Memory (V$OSSTAT)';
DEF filename = 'OsMemory.html';
DEF nextpage = 'TimeModel.html';
DEF prevpage = 'OsStat.html';
@@00_begin.sql

@@sql/sub/OsMemory.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check how much of the total physical memory is allocated to Oracle. Also can check if there
PRO is enough available memory to add to Oracle.</p>

@@00_end.sql
