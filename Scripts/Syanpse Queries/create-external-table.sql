-- Step 1: Drop external table if it already exists
IF OBJECT_ID('gold.extsales', 'U') IS NOT NULL
    DROP EXTERNAL TABLE gold.extsales;
GO

-- Step 2: (Optional) Create schema if not exists
IF NOT EXISTS (
    SELECT * FROM sys.schemas WHERE name = 'gold'
)
    EXEC('CREATE SCHEMA gold');
GO

-- Step 3: Create Database Scoped Credential if not exists
IF NOT EXISTS (
    SELECT * FROM sys.database_scoped_credentials WHERE name = 'cred_yaseen'
)
BEGIN
    CREATE DATABASE SCOPED CREDENTIAL cred_yaseen
    WITH IDENTITY = 'Managed Identity';
END
GO

-- Step 4: Create External Data Source for Silver if not exists
IF NOT EXISTS (
    SELECT * FROM sys.external_data_sources WHERE name = 'source_silver'
)
BEGIN
    CREATE EXTERNAL DATA SOURCE source_silver
    WITH (
        LOCATION = 'https://yaeenawstoragedatalake.blob.core.windows.net/silver',
        CREDENTIAL = cred_yaseen
    );
END
GO

-- Step 5: Create External Data Source for Gold if not exists
IF NOT EXISTS (
    SELECT * FROM sys.external_data_sources WHERE name = 'source_gold'
)
BEGIN
    CREATE EXTERNAL DATA SOURCE source_gold
    WITH (
        LOCATION = 'https://yaeenawstoragedatalake.blob.core.windows.net/gold',
        CREDENTIAL = cred_yaseen
    );
END
GO

-- Step 6: Create External File Format if not exists
IF NOT EXISTS (
    SELECT * FROM sys.external_file_formats WHERE name = 'format_parquet'
)
BEGIN
    CREATE EXTERNAL FILE FORMAT format_parquet
    WITH (
        FORMAT_TYPE = PARQUET
    );
END
GO

-- Step 7: Create External Table (CTAS)
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales;
GO

-- Step 8: Verify data
SELECT TOP 10 * FROM gold.extsales;
GO
