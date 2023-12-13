DEF title = 'System wide wait events (GV$SYSTEM_EVENT)';
DEF filename = 'Waits.html';
DEF nextpage = 'SegmentStatistics.html';
DEF prevpage = 'InvalidPackages.html';
@@00_begin.sql

SET MARK HTML ON ENTMAP OFF;
@@sql/sub/Waits.sql

SET MARK HTML OFF;
PRO <h2>Ignore 'enq: TX - row lock contention':</h2>
SET MARK HTML ON ENTMAP OFF;
@@sql/sub/WaitsNoRowLock.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Oracle wait events are how Oracle records time spent doing something other than executing a
PRO SQL statement. Wait events come in two main types, ones which are important and ones which are
PRO ignorable. This page gives an idea of the severity (or lack of) and type of problems in the 
PRO system. A discussion of wait events is beyond the scope of this explanation but there are books
PRO on the subject.</p>
PRO <p>This page is limited to wait events with Percentage > 1.</p>
PRO <p>Note: Idle wait events are intentionally not reported in this view.</p>

@@00_end.sql
