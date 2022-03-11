DEF title = 'PGA Target Advice (V$PGA_TARGET_ADVICE)';
DEF filename = 'PgaTargetAdvice.html';
DEF nextpage = 'SharedPoolAdvice.html';
DEF prevpage = 'DbCacheAdvice.html';
@@00_begin.sql

@@sql/sub/PgaTargetAdvice.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Predicts how adjusting <b>pga_aggregate_target</b> will impact the PGA usage.</p>
PRO <p><b>SIZE_FACTOR = 1</b> is the current PGA size</p>
PRO <p><b>SIZE_FACTOR = 2</b> is twice the current PGA size</p> 
PRO <p>Goal should be <b>ESTD_PGA_CACHE_HIT_PERCENTAGE > 90</b>. If ESTD_PCT_OF_DB_TIME_FOR_READS
PRO is lower, then this is an indication that the PGA is undersized. Typically 1 to 2 GB is large 
PRO enough for the PGA.</p>

@@00_end.sql
