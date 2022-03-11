SELECT t.tablespace_name, 
  ROUND(t.tablespace_size / 1073741824,1) as Size_GB,
  ROUND(t.allocated_space / 1073741824,1) as Allocated_Space_GB,
  ROUND(t.free_space / 1073741824,1) as Free_Space_GB,
  ROUND(t.free_space/t.tablespace_size*100,1) AS Percent_Free 
FROM dba_temp_free_space t;
