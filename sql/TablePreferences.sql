DEF title = 'Table Preferences (DBA_TAB_STAT_PREFS)';
DEF filename = 'TablePreferences.html';
DEF nextpage = 'TableSampleSize.html';
DEF prevpage = 'QueueEntry.html';
@@00_begin.sql

@@sql/sub/TablePreferences.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Check for existing table preferences. Does not necessarily indicate a problem. A preference
PRO can tell Oracle to never create a histogram on a column:</p>
PRO <p><a href="https://blogs.oracle.com/optimizer/entry/how_do_i_drop_an_existing_histogram_on_a_column_and_stop_the_auto_stats_gathering_job_from_creating">
PRO How do I drop an existing histogram on a column and stop the Auto Stats gathering job from creating it in the future?</a></p>

@@00_end.sql
