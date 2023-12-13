# Change Log
Download the latest version from either:
- https://www.ptc.com/en/support/article?n=CS271394
- https://github.com/jspilinek/oracleperf/releases

## [v23.07] - 2023-12-13
### Added
- 2nd table in Waits.html with 'enq: TX - row lock contention' filter
### Changed
- Filter DBMONITOR, GSMROOTUSER, RMAN_USER in Schemas.sql

## [v23.06] - 2023-10-09
### Added
- Highlighting added to TablesWithoutIndexes.html and IdColumnNoIndexes.html
### Changed
- Removed CDB$ROOT filter
- Update comments in Schemas.html
- Filter PDBADMIN and RDSADMIN in Schemas.sql

## [v23.05] - 2023-03-07
### Changed
- Added LOB column name to SegmentStatistics.html

## [v23.04] - 2023-02-28
### Fixed
- AWR-SQLID reports

## [v23.03] - 2023-02-03
### Changed
- Ignore DBMS_SCHEDULER when creating AWR SQL reports

## [v23.02] - 2023-01-18
### Fixed
- Corrected ESCAPE character

## [v23.01] - 2023-01-18
### Changed
- Filter out AUD_* tables from Tables.sql, Indexes.sql and Columns.sql

## [v22.10] - 2022-12-23
### Added
- Schemas.html
- Ignore WBM schemas when entered schema is ALL
### Fixed
- Column width for CursorCheck.html
- Column width in FullSqlTextAndPlans.html

## [v22.09] - 2022-12-15
### Added
- Highlight important table rows
- Warning red text for table cell values
### Fixed
- Corrected previous page link on LockedStats.html
- Increase width of estd_pct_of_db_time_for_reads
- Corrected < symbol in DbCacheAdvice.html comments
- Corrected comments in PgaTargetAdvice.html and SharedPoolAdvice.html

## [v22.08] - 2022-06-16
### Fixed
- Oracle version wasn't displaying correctly for version prior to 18c

## [v22.07] - 2022-04-12
### Fixed
- Columns.txt line width

## [v22.06] - 2022-03-25
### Fixed
- Index.txt format
- Columns.txt format
- FullSqlTextAndPlans.txt format

## [v22.05] - 2022-03-10
### Changed
- Added link to article CS271394 on 00_oracleperf.html
- Error handling for ORA-00904: "DBMS_WORKLOAD_REPOSITORY"."AWR_REPORT_HTML": invalid identifier
  - 00_license.sql checks if user has access to DBMS_WORKLOAD_REPOSITORY in order to generate AWR AwrReports
  - Message in 00_oracleperf.html if user does not have access to DBMS_WORKLOAD_REPOSITORY
  - No longer execute AWR reports if user cannot access DBMS_WORKLOAD_REPOSITORY
### Fixed
- Cleaned up 00_ErrorCheck.sql
- 00_oracleperf.html displays full_version from V$INSTANCE when version is 18c or later. As an example we now see 19.3.0.0.0 (full_version) instead of 19.0.0.0.0 (version)

## [v22.04] - 2022-03-08
### Added
- Dark Theme!
### Changed
- oracleperf.css Defaults to light theme. Switches to dark theme if browser is using dark theme
- oracleperf.sql slight change to support dark theme

## [v22.03] - 2022-03-03
### Added
- 00_ErrorCheck.sql to perform environment validations and abort if there are any issues detected
- 00_ErrorCheck.sql will abort if script is running in SQL Developer. This is done because SQL Developer does not support a lot of the formatting options used (e.g. HTML MARKUP)
### Changed
- 00_schema.sql ignores additional schema names: DBSFWUSER, GGSYS, REMOTE_SCHEDULER_AGENT, SYS$UMF, SYSRAC
### Fixed
- 00_schema.sql now rejects invalid schema names provided as input

## V22.02 - 2022-02-24
### Added
- 00_test1.sql and 00_test2.sql. These scripts do not do anything, just used to validate access to subdirectories
- 00_ColumnFormat.sql to new format for various number columns for easier reading
- NUMWIDTH set to 30 (default 10) to disable scientific notation
### Changed
- Script will exit with error if 00_test1.sql or 00_test2.sql are not accessible
- Moved most column formats from individual scripts into 00_ColumnFormat.sql to make it easier to identify overlaps
### Fixed
- Corrected typo in ParseStatistics.html

## V22.01 - 2022-01-12
### Added
- Exadata.html to check if database is exadata

## V21.09 - 2021-12-23
### Changed
- PerfTablesAge.html updated column headers

## V21.08 - 2021-12-22
### Changed
- PerfTablesAge.html now gets accurate ages using le_timestamp instead of column stats
### Removed
- sub/PerfTablesAge.sql

## V21.07 - 2021-10-22
### Changed
- Improved comments in ImportantParam.html and SgaInfo.html

## V21.06 - 2021-04-12
### Fixed
- FullSqlTextAndPlans.html plan formatting fixed

## V21.05 - 2021-04-06
### Changed
- Improved how FullSqlTextAndPlans.txt and FullSqlTextAndPlans.html are generated
- FullSqlTextAndPlans.txt and FullSqlTextAndPlans.html ordered by elapsed time (previously by sql_id)
- Plans now include peeked binds and outline
- oarcleperf.css updated to colorize plans in FullSqlTextAndPlans.html
### Fixed
- Eliminated "cannot fetch plan for SQL_ID" in FullSqlTextAndPlans.txt and FullSqlTextAndPlans.html

## V21.04 - 2021-03-11
### Fixed
- Addressed "ORA-01722: invalid number" in TableDOP.html
- Corrected 00_values.sql so the script will continue on error
### Changed
- Added CS37197 to comments in Blobs.html

## V21.03 - 2021-03-03
### Fixed
- QueueEntry.sql updated to handle multi-byte databases
- &&schema_list filter added to QueueEntry.sql WindchillVersion.sql WindchillVersionHistory.sql
- current_owner changed to VARCHAR2(128) in QueueEntry.sql WindchillVersion.sql WindchillVersionHistory.sql

## V21.02 - 2021-02-25
### Added
- QueueEntry.html
### Changed
- Minor change to ImportantParam.html comments

## V21.01 - 2021-01-14
### Changed
- 00_values.sql will exit on error if user does not have access to V$INSTANCE. This can happen if the script was incorrectly run as Windchill db user.

## V20.03 - 2020-04-09
### Changed
- Added Days_Old column to PerfTablesAge.html

## V20.02 - 2020-04-09
### Added
- PerfTablesAge.html

## V20.01 - 2020-02-19
### Fixed
- Corrected next page link in LockedStats.html
- Added child number to join condition in ActiveSql.sql

## V19.13 - 2019-12-03
### Added
- PctFree.html
### Changed
- Added pct_free to ChainedRows.html
- Added SET HEADING ON to oracleperf.sql
- Added SET ESCAPE ON to oracleperf.sql

## V19.12 - 2019-11-08
### Fixed
- LockedStats.html

## V19.11 - 2019-10-30
### Changed
- DbCacheAdvice.sql updated for RAC
- SgaInfo.sql updated for RAC
- SgaTargetAdvice.sql updated for RAC
- PgaTargetAdvice.sql updated for RAC
- SharedPoolAdvice.sql updated for RAC

## V19.10 - 2019-10-15
### Added
- LockedStats.html
### Changed
- Version number changed to point release system
- Major release will be updated each year
- Minor release will be an incremental number
- Going with 19.10 since this is the 10th update of 2019
- Added optimizer_adaptive_features and optimizer_adaptive_statistics to Important Parameters
- Blobs.html changed from MB to GB
### Fixed
- ChainedRows.sql
- Comments in DmlActivity.html

## V9 - 2019-06-26
### Added
- TempTablespace.html
### Fixed
- ActiveSql.sql sort on SID in case there's two queries with the same SQL_ID

## V8 - 2019-05-14
### Changed
- ChainedRows.sql updated

### Fixed
- Corrected TableEmptySpace.sql

## V7 - 2019-04-02
### Changed
- 00_schema.sql updated with additional schema filters
- Updated article link for QueueEntry in Blobs.html
- TableObservations.html split into TableSampleSize.html, TableNullAnalyzed.html and TableStaleStats.html
- IndexObservations.html split into IndexSampleSize.html, IndexNullAnalyzed.html and IndexStaleStats.html
- ColumnObservations.html split into ColumnSampleSize.html and ColumnNullAnalyzed.html
### Fixed
- TableDOP.sql degree converted from string to number
- ActiveSql.sql sort on SQL_ID in case there's two queries with the same ELAPSED_TIME
- TableNullAnalyzed.sql WHERE clause corrected

## V6 - 2019-03-21
### Changed
- TableEmptySpace.sql updated with CTE for db_block_size
### Fixed
- Corrected article link in ChainedRows.html and TableEmptySpace.html
- TablesWithoutIndexes.sql was quering the wrong schemas

## V5 - 2019-03-11
### Added
- 00_schema.sql prompts for schema to run report against
- readme.txt
- changelog.txt
- SegmentStatistics.html now includes LOB segment name
### Changed
- <font> tag no longer used as it's not supported in HTML5
- TablesWithoutIndexes.html updated with additional comments
### Fixed
- TablesWithoutIndexes.sql no longer filters out tables with blob columns

## V4 - 2019-03-04
### Added
- TablesWithoutIndexes.sql
### Changed
- DmlActivity.sql reduced from top 100 to top 20
- ActiveSql.sql updated to get PHV and child number and fixed days portion of elapsed time
- InvalidIndexes.sql query updated
- 00_license.sql updated to run AwrRetention.sql first

## V3 - 2019-02-13
### Added
- TableDOP.html Check for tables that have Degree of Parallelism (DOP) set higher than 1 (default)
- Waits.html now has Percentage and Link columns
- SgaInfo.html now has Percentage column
### Changed
- SqlLiterals.sql updated with column formatting
### Removed
- Removed unnecessary columns from TransientTables.sql
- Column subscripts removed, moved into oracleperf.sql

## V2 - 2019-02-06
### Added
- BlockingSql.html identify blocking and waiting sessions
### Changed
- Scripts in sql directory now only perform output formatting. Actual query logic moved into sql/sub directory
- ActiveSql.sql updated to GV$ views to support Oracle RAC

## V1 - 2019-01-16
### Fixed
- ActiveSql.sql error addressed

## V0.18 - 2018-12-21
### Fixed
- ActiveSql.sql updated to correctly display elapsed time for queries that have been running longer than 99 hours
- SqlPlanBaselines.sql updated with limit to prevent too much data collection

## V0.17 - 2018-10-10
### Added
- Triggers.html

## V0.16 - 2018-08-31
### Added
- 00_oracleperf.html now displays module to confirm script was run in sqlplus (sqldeveloper is not supported)
### Changed
- ViewDefinitions.html updated with comment

## V0.15 - 2018-07-19
### Fixed
- FullSqlTextAndPlans.sql updated with ENTMAP settings to fix HTML characters

## V0.14 - 2018-03-14
### Fixed
- Performance improvements for FullSqlTextAndPlans.sql
- HTML formatting fixed in FullSqlTextAndPlans.sql

## V0.13 - 2018-02-02
### Added
- OracleVersion.html now includes update history to see which patches have been installed

## V0.12 - 2018-02-01
### Added
- 00_license.sql verifies Enterprise Edition before attempting to use tuning and diagnostics pack
- SqlLiterals.html check for SQL using literals or too many dynamic sampling queries
- FunctionIndexes.sql now generates txt output
### Fixed
- oracleperf.sql alter session to set period (.) for the decimal character and a comma (,) for the thousands character
- WindchillVersionHistory.sql SERVEROUTPUT size set to unlimited

## V0.11 - 2018-01-19
### Added
- WindchillVersionHistory.html added to display full Windchill update history
- WindchillVersion.html added timestamp of latest install

## V0.10 - 2018-01-18
### Changed
- WindchillVersion.html improved

## V0.9 - 2017-12-07
### Added
- oracleperf.sql SET TRIMSPOOL ON to allow trailing blanks at end of each line for FullSqlTextAndPlans.txt
- ActiveSql.html updated with comment
- AwrReports.sql now displays total_sec in 00_oracleperf.html 
- FullSqlTextAndPlans.sql updated with additional columns: Application Wait, Concurrency Wait, Cluster Wait, User IO Wait
### Changed
- Scripts generated for AWR now have filename starting with 99_ to make it easier to identify that this is a generated file

## V0.8 - 2017-12-01
### Changed
- DiskIO.sql output changed from hundredths of second to milliseconds
- Instance.sql sort on instance id
- OracleVersion.sql now uses GV$ for Oracle RAC
- Uptime.sql now uses GV$ for Oracle RAC
### Fixed
- AwrSqlReports.sql improved

## V0.7 - 2017-10-31
### Added
- AwrRetention.html to display AWR config
### Changed
- AwrReports.sql limited to last 7 days
- AwrSqlReports.sql limited to last 7 days
- LongVarchar2Histograms.html comment updated
- Waits.sql round "Time Waited (s)" to zero decimal places

## V0.6 - 2017-10-12
### Added
- ColumnObservations.html
- IndexObservations.html
- TableObservations.html
### Changed
- Renamed ColumnStatistics.sql to Columns.sql
- LongVarchar2Histograms.html comment updated

## V0.5 - 2017-10-11
### Changed
- ColumnStatistics.html comment updated
- Indexes.html column order updated

## V0.4 - 2017-10-10
### Added
- oracleperf.sql SET ECHO OFF to disable display of commands as they are executed
### Changed
- Tables.html comment updated

## V0.3 - 2017-10-05
### Added
- 00_begin.sql updated with Prev and Next links
- 00_end.sql updated with Prev and Next links
- MemoryTargetAdvice.html comment added

## V0.2 - 2017-09-28
### Added
- FullSqlTextAndPlans.sql "Please wait..." message added
- FullSqlTextAndPlans.sql schema name added
- OsStat.sql order by added
- Waits.sql updated with instance id for Oracle RAC
### Changed
- AwrSqlReports.sql switched from total seconds to average seconds

## V0.1 - 2017-09-22
- Yay! First release
