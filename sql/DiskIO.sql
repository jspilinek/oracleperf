DEF title = 'Disk I/O (V$FILESTAT V$TEMPSTAT)';
DEF filename = 'DiskIO.html';
DEF nextpage = 'FreeTablespace.html';
DEF prevpage = 'LogMode.html';
@@00_begin.sql

@@sql/sub/DiskIO.sql
@@sql/sub/TempDiskIO.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Ordered by <b>AvgReadTime</b> + <b>AvgWriteTime</b></p>
PRO <p>Check I/O performance of the system for "large" delays. Review <b>AvgReadTime</b>,
PRO <b>AvgWriteTime</b>, <b>MaxIoRtm</b> and <b>MaxIoWtm</b> columns. These times have been
PRO converted from centiseconds to milliseconds. A four digit value indicates 1+ seconds to perform an I/O.</p>
PRO <p>Note this information becomes less reliable when the database has been up for days or weeks.
PRO A one hour AWR report provides much more reliable information when disk I/O is suspect.</p>
PRO <p>When there are 2 digit or larger entries in <b>AvgReadTime</b> or <b>AvgWriteTime</b> columns, then suspect a constant I/O problem.</p>
PRO <p>When there are 3 digit or larger entries in <b>MaxIoRtm</b> or <b>MaxIoWtm</b> columns, then suspect at least a sporadic I/O problem.</p>
@@00_end.sql
