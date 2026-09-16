/*
Project: Sales Performance & Executive Dashboard
Author: Ehsan Ansari
Database: AdventureWorks
Purpose: Initial database exploration
*/

USE AdventureWorks2025;
GO

SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT 
    s.name AS SchemaName,
    t.name AS TableName,
    SUM(p.rows) AS RowCount
FROM sys.tables t
INNER JOIN sys.schemas s
    ON t.schema_id = s.schema_id
LEFT JOIN sys.partitions p
    ON t.object_id = p.object_id
    AND p.index_id IN (0,1)
GROUP BY 
    s.name,
    t.name
ORDER BY 
    SUM(p.rows) DESC;