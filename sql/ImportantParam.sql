DEF title = 'Important Parameters (GV$SYSTEM_PARAMETER2)';
DEF filename = 'ImportantParam.html';
DEF nextpage = 'NonDefaultParam.html';
DEF prevpage = 'Instance.html';
@@00_begin.sql

@@sql/sub/ImportantParam.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Guidelines for Windchill systems are:</p>

PRO <p>Automatic Memory Management (AMM):<ul>
PRO <li><b>memory_max_target</b>:</li>
PRO <ul><li>Smaller systems 4-10G</li>
PRO <li>Medium/highly tuned systems: 10-25G</li>
PRO <li>Large systems (even highly tuned systems): 25-80G</li></ul>
PRO <li><b>memory_target</b>: Recommended: equal to <b>memory_max_target</b></li></ul></p>

PRO <p>Automatic Shared Memory Management (ASMM):<ul>
PRO <li>ASMM is an alternate to AMM. In some cases AMM is used when it is desired to limit the PGA and ensure a larger buffer cache in the SGA. In most cases AMM is OK.</li>
PRO <li>AMM is disabled when <b>memory_max_target=0</b> and <b>memory_target=0</b></li>
PRO <li><b>pga_aggregate_target</b> : 100M minimum up to 1G is reasonable</li>
PRO <li><b>sga_max_size</b> : 1G minimum, up to 3G is probably reasonable</li>
PRO <li><b>sga_target</b> : Equal to <b>sga_max_size</b></li></ul></p>

PRO <p>Oracle 12c R1 (12.1.x.x):
PRO <ul><li><b>optimizer_adaptive_features</b> : 12c R1 (12.1.x.x) Recommended: FALSE</li></ul></p>

PRO <p>Oracle 12c R2 (12.2.x.x) and later versions:
PRO <ul></li><b>optimizer_adaptive_statistics</b> : 12c R2 (12.2.x.x) Recommended: FALSE</li></ul></p>

PRO <p>All releases of Oracle:<ul>
PRO <li><b>optimizer_dynamic_sampling</b> : Default Recommended: 2</li>
PRO <li><b>optimizer_features_enable</b> : Default Recommended: match Oracle version</li>
PRO <li><b>optimizer_index_caching</b>: Default Recommended: 0</li>
PRO <li><b>optimizer_index_cost_adj</b> : Default 100, Recommended: 10</li>
PRO <li><b>optimizer_mode</b> : Default Recommended: ALL_ROWS</li></ul></p>

PRO <script>ImportantParam()</script>

@@00_end.sql
