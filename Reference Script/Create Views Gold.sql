------------------------
-- CREATE VIEW CALENDAR
------------------------
create view gold.calendar
AS
SELECT 
* 
from 
OPENROWSET(
    BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) as query1

------------------------
-- CREATE VIEW CUSTOMER
------------------------
create view gold.customer
AS
SELECT
 * 
 from OPENROWSET(
    BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) as query1

select * 
from gold.customer

----------------------------
-- CREATE VIEW PRODUCTS
---------------------------
create view gold.products
AS
SELECT * from OPENROWSET(
    BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) as query1

------------------------
-- CREATE VIEW RETURNS
------------------------
create view gold.returns
AS
SELECT * from OPENROWSET(
    BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) as query1

   ------------------------
-- CREATE VIEW SALES
------------------------
create view gold.sales
AS
SELECT * from OPENROWSET(
    BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) as query1

------------------------
-- CREATE VIEW SUBCAT
------------------------
CREATE VIEW gold.subcat
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/Product_Subcategories/',
            FORMAT = 'PARQUET'
        ) as query1

------------------------
-- CREATE VIEW TERRITORIES
------------------------
CREATE VIEW gold.territories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adlsprojectstorageacc.dfs.core.windows.net/silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as query1


---------------------------------
-- querying data using view
----------------------------------
SELECT * from gold.calendar;

SELECT * from gold.customer;

SELECT * from gold.products;

SELECT * from gold.returns;

SELECT * from gold.sales;

SELECT * from gold.subcat;

SELECT * from gold.territories;
