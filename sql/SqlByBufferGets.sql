DEF title = 'Worst SQL By Buffer Gets (V$SQLSTATS)';
DEF filename = 'SqlByBufferGets.html';
DEF nextpage = 'SqlByDiskReads.html';
DEF prevpage = 'SqlByAverageElapsedTime.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByBufferGets.sql

@@00_end.sql
