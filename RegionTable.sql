--Before loading Region data
ALTER TABLE ProductSales
ADD RegionClean varchar(50)

SELECT * FROM dbo.ProductSales

--Clean Region data - copy region into Region Clean
UPDATE dbo.ProductSales
SET RegionClean = Region

SELECT RegionClean FROM dbo.ProductSales

-- Update
UPDATE dbo.ProductSales
SET RegionClean = 'Central America and the Caribbean'
WHERE RegionClean = 'Central America and the C'

UPDATE dbo.ProductSales
SET RegionClean = 'Middle East and North Africa'
WHERE RegionClean = 'Middle East and North Afr'


--Create Region table
CREATE TABLE Region
(
RegionID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
RegionName VARCHAR(50),
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME
)

--Insert Region Data
INSERT INTO dbo.Region
SELECT DISTINCT [RegionClean],
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM dbo.ProductSales

SELECT * FROM dbo.Region

