DEF title = 'Shared Pool Advice (V$SHARED_POOL_ADVICE)';
DEF filename = 'SharedPoolAdvice.html';
DEF nextpage = 'CursorCheck.html';
DEF prevpage = 'PgaTargetAdvice.html';
@@00_begin.sql

@@sql/sub/SharedPoolAdvice.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Predicts how adjusting the shared pool will affect parse time.</p>
PRO <p><b>SIZE_FACTOR = 1</b> is the current shared pool size</p>
PRO <p><b>SIZE_FACTOR = 2</b> is twice the current shared pool size</p> 
PRO <p>Goal should be little to no improvement in <b>ESTD_LC_TIME_SAVED</b> when the shared pool
PRO size is increased. Shared pool problems are very rare.</p>

@@00_end.sql
