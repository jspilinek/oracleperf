DEF title = 'DB Cache Advice AKA Buffer Pool Advisory (V$DB_CACHE_ADVICE)';
DEF filename = 'DbCacheAdvice.html';
DEF nextpage = 'PgaTargetAdvice.html';
DEF prevpage = 'MemoryTargetAdvice.html';
@@00_begin.sql

@@sql/sub/DbCacheAdvice.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>This view gives an idea of how increasing the buffer cache will decrease the disk I/O (thereby improving performance).</p>
PRO <p><b>SIZE_FACTOR = 1</b> is the current buffer cache size</p>
PRO <p><b>SIZE_FACTOR = 2</b> twice the current buffer cache size</p> 
PRO <p><b>ESTD_*</b> columns give an estimate on how I/O will change when the buffer cache is increased or decreased.<p>
PRO <p>Goal should be <b>ESTD_PCT_OF_DB_TIME_FOR_READS \&lt; 10</b>. If ESTD_PCT_OF_DB_TIME_FOR_READS
PRO is higher, then first tune inefficent SQL. Then wait a day or so to recheck if 
PRO ESTD_PCT_OF_DB_TIME_FOR_READS has reached the goal. If there are no inefficent SQL to tune, this
PRO is an indication that more memmory should be allocated to the SGA.</p>
PRO <p>Parameters to change are <b>memory_max_target</b> and <b>memory_target</b> to allow Oracle
PRO to automatically resize the memory allocated to the buffer cache. If both memory parameters are
PRO set to zero, then increase the <b>sga_max_size</b> and <b>sga_target</b> to allow Oracle to 
PRO automatically increase the buffer cache.</p>

@@00_end.sql
