-- Create Customer Table
CREATE TABLE Customer
(
CustID INT NOT NULL PRIMARY KEY,
CustName VARCHAR(50),
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME
)

--Insert Data
INSERT INTO Customer
SELECT DISTINCT [CustID],
[CustName],
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM dbo.ProductSales

SELECT * From dbo.Customer