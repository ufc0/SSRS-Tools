USE databaseB;
GO

IF OBJECT_ID('dbo.view_name', 'V') IS NOT NULL
    DROP VIEW dbo.view_name;
GO

CREATE VIEW dbo.view_name (column1, column2, column3)
AS
    SELECT column1, column2, column3
    FROM databaseA.dbo.table_name;
GO



DECLARE @cols AS NVARCHAR(MAX), @query AS NVARCHAR(MAX);

SELECT @cols = STUFF((SELECT ',' + QUOTENAME(COLUMN_NAME)
                      FROM INFORMATION_SCHEMA.COLUMNS
                      WHERE TABLE_NAME = 'table_name'
                      FOR XML PATH(''), TYPE
                     ).value('.', 'NVARCHAR(MAX)'), 1, 1, '');

SET @query = 'SELECT ' + @cols + ' FROM table_name';

EXECUTE(@query);