-- Create Product Table
CREATE TABLE Product
(
ProductID VARCHAR(50) NOT NULL PRIMARY KEY,
ProductName VARCHAR(50),
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME
)

--Insert Data
INSERT INTO Product
SELECT DISTINCT [ProductID],
[ProductName],
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM dbo.ProductSales

SELECT * From dbo.Product