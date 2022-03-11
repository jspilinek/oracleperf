select tf.name TempFile,
  round(stat.READTIM*10/nvl(nullif(stat.PHYRDS,0),1)) as "AvgReadTime (ms)",
  round(stat.WRITETIM*10/nvl(nullif(stat.PHYWRTS,0),1)) as "AvgWriteTime (ms)",
  stat.MAXIORTM*10 as "MaxIoRtm (ms)", 
  stat.MAXIOWTM*10 as "MaxIoWtm (ms)",
  stat.*
from V$TEMPSTAT stat,  V$TEMPFILE tf
where tf.FILE# = stat.FILE#
and PHYBLKRD / (decode(PHYRDS, 0,1,phyrds)) >= 1
order by "AvgReadTime (ms)" + "AvgWriteTime (ms)" DESC;
