SELECT owner,
    table_name,
    column_name,
    num_distinct,
    density,
    num_nulls,
    histogram,
    num_buckets,
    data_length,
    nullable,
    data_type,
    sample_size,
    data_length,
    low_value,
    high_value
FROM dba_tab_columns
WHERE owner IN (&&schema_list)
    AND histogram='FREQUENCY'
    AND num_distinct > 257
ORDER BY owner, table_name, column_name;
