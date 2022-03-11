# oracleperf.sql
Oracle Performance and Diagnostics Report for PTC Windchill PDMLink

Check https://www.ptc.com/en/support/article?n=CS271394 for latest version of this script

General Info:

    oracleperf.sql is the main script and will execute the other scripts found in the sql directory
    Results of the script are saved in the html directory
    html/00_oracleperf.html is the main file of the report
    Comments on how to interpret the results are listed at the bottom of each html file
    This script is designed for Oracle 11g and later releases
    
Instructions:

    1) Extract contents of oracleperf-v22.04.zip
    2) Change directory to extracted content
    3) Connect to SQL*Plus as system, sysdba: or any user with access to DBA tables
    4) Execute oracleperf.sql
    5) Enter schema name to generate report for specific schema or enter ALL to report on all schemas
    6) Enter T, D or N for Oracle Pack License
        Oracle Pack License? (Tuning, Diagnostics or None) [ T | D | N ] (required)
        If your Database is licensed to use the Oracle Tuning pack please enter T
        If you have a license for Diagnostics pack but not for Tuning pack, enter D
        If you have both Tuning and Diagnostics packs, enter T
        If you are unsure about the license, enter N
        Be aware value N eliminates queries to the AWR and ADDM
    7) When the oracleperf.sql script completes zip the entire contents of the html directory
