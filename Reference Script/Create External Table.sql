-------------------
-- create Master Key
------------------
CREATE MASTER KEY  ENCRYPTION BY PASSWORD ='Admin@123';

--------------------
-- create database credential
--------------------------------

CREATE DATABASE SCOPED CREDENTIAL project_cred
WITH IDENTITY = 'Managed Identity'


----------------------------------
-- Create External Data Source
---------------------------------
CREATE EXTERNAL DATA SOURCE silver_source
WITH
(
    LOCATION = 'https://adlsprojectstorageacc.dfs.core.windows.net/silver',
    CREDENTIAL = project_cred
);

CREATE EXTERNAL DATA SOURCE gold_source
WITH
(
    LOCATION = 'https://adlsprojectstorageacc.dfs.core.windows.net/gold',
    CREDENTIAL = project_cred
);

--------------------------------
-- Create External File Format
---------------------------------
CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-----------------------------
-- Create external table EXTSales
---------------------------------
create EXTERNAL table gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)AS
SELECT * from gold.sales;

SELECT * from gold.extsales;