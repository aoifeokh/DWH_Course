-- Create Sale Table

CREATE TABLE Sale 
(
SaleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
DateSold Date NOT NULL,
ProductID VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
CustID INT NOT NULL FOREIGN KEY REFERENCES Customer(CustID),
CountryID INT NOT NULL FOREIGN KEY REFERENCES Country(CountryID),
ChannelID INT NOT NULL FOREIGN KEY REFERENCES SalesChannel(ChannelID),
UnitsSold INT NOT NULL,
CreateTimestamp DATETIME,
UpdateTimestamp DATETIME
)


-- Insert Sale Data 
INSERT INTO Sale 
SELECT
S.dateSold,
S.productID,
S.custID,
C.CountryID,
SC.ChannelID,
S.unitsSold,
CURRENT_TIMESTAMP AS CreateTimestamp,
CURRENT_TIMESTAMP AS UpdateTimestamp
FROM
ProductSales AS S
INNER JOIN Country AS C ON S.Country = C.CountryName
INNER JOIN SalesChannel AS SC ON S.SalesChannel = SC.ChannelName

SELECT * FROM dbo.Sale