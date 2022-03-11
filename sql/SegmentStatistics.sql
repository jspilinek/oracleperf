DEF title = 'Segment Statistics (V$SEGMENT_STATISTICS)';
DEF filename = 'SegmentStatistics.html';
DEF nextpage = 'SqlByElapsedTime.html';
DEF prevpage = 'Waits.html';
DEF top_seg = 20;
DEF seg_limit = 100;

@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Logical Reads:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatLogicalReads.sql

SET MARK HTML OFF;
PRO <h2>Physical Reads:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatPhysicalReads.sql

SET MARK HTML OFF;
PRO <h2>Physical Read Requests:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatPhysicalReadReq.sql

SET MARK HTML OFF;
PRO <h2>Physical Writes:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatPhysicalWrites.sql

SET MARK HTML OFF;
PRO <h2>Physical Write Requests:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatPhysicalWriteReq.sql

SET MARK HTML OFF;
PRO <h2>Table Scans:</h2>
@@sql/sub/StatTableScans.sql

SET MARK HTML OFF;
PRO <h2>DB Block Changes:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatBlockChanges.sql

SET MARK HTML OFF;
PRO <h2>Row Lock Waits:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatRowLockWaits.sql

SET MARK HTML OFF;
PRO <h2>Buffer Busy Waits:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/StatBufferBusy.sql

@@00_end.sql
