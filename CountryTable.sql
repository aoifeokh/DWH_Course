-- Create Country Table
CREATE TABLE Country
(
CountryID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
CountryName VARCHAR(50),
RegionID INT FOREIGN KEY REFERENCES Region(RegionID),
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME,
)

INSERT INTO dbo.Country
SELECT DISTINCT S.Country, R.RegionID,
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM dbo.Region AS R
INNER JOIN dbo.ProductSales AS S
ON R.RegionName = S.RegionClean

SELECT * FROM dbo.Country