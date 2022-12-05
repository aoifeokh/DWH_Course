-- Create SalesChannel table
CREATE TABLE SalesChannel
(
ChannelID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
ChannelName VARCHAR(10),
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME
)

-- Insert SalesChannel Data
INSERT INTO SalesChannel
SELECT DISTINCT [SalesChannel],
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM SalesDW.[dbo].[ProductSales]

SELECT * FROM SalesChannel