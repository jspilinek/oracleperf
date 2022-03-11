SELECT CASE WHEN COUNT(cell_name) > 0 THEN 'IS EXADATA'
 ELSE 'IS NOT EXADATA' END "IsExadata"
FROM gv$cell_state; 
