COL READTIM HEADING 'READTIM (cs)'
COL WRITETIM HEADING 'WRITETIM (cs)'
COL SINGLEBLKRDTIM HEADING 'SINGLEBLKRDTIM (cs)'
COL AVGIOTIM HEADING 'AVGIOTIM (cs)'
COL LSTIOTIM HEADING 'LSTIOTIM (cs)'
COL MINIOTIM HEADING 'MINIOTIM (cs)'
COL MAXIORTM HEADING 'MAXIORTM (cs)'
COL MAXIOWTM HEADING 'MAXIOWTM (cs)'

select df.name,
  ts.name Tablespace,
  round(stat.READTIM*10/nvl(nullif(stat.PHYRDS,0),1)) as "AvgReadTime (ms)",
  round(stat.WRITETIM*10/nvl(nullif(stat.PHYWRTS,0),1)) as "AvgWriteTime (ms)",
  stat.MAXIORTM*10 as "MaxIoRtm (ms)", 
  stat.MAXIOWTM*10 as "MaxIoWtm (ms)",
  stat.* 
from V$FILESTAT stat, v$datafile df, V$TABLESPACE ts
where df.FILE# = stat.FILE#
  and stat.PHYBLKRD / (decode(stat.PHYRDS, 0,1,phyrds)) >= 1
  and df.TS#=ts.TS#
order by "AvgReadTime (ms)" + "AvgWriteTime (ms)" DESC;
