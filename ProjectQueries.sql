select *
from [SalesLT].[Address]

-- 3. Clean all the nul values from tables.
Select AddressID, AddressLine1, ISNULL(AddressLine2, ' ') AS AddressLine2, City, StateProvince, CountryRegion, PostalCode, rowguid, ModifiedDate
from [SalesLT].[Address];

Select CustomerID, NameStyle, ISNULL(Title,' ') AS Title, FirstName, ISNULL(MiddleName, ' ') AS MiddleName, LastName, ISNULL(Suffix, ' ') AS Suffix, CompanyName, EmailAddress, 
		Phone, PasswordHash, PasswordSalt, rowguid, ModifiedDate
from [SalesLT].[Customer];

Select ProductID, Name, ProductNumber, ISNULL(Color, ' ') AS Color, StandardCost, ListPrice, ISNULL(Size, ' ') AS Size, ISNULL(Weight,'0')AS ProductWeight, ProductCategoryID, ProductModelID,
		SellStartDate, ISNULL(SellEndDate, ' ') AS SellEndDate, ISNULL(DiscontinuedDate, ' ') AS DiscontinuedDate, ThumbNailPhoto, ThumbnailPhotoFileName, rowguid, ModifiedDate
from [SalesLT].[Product];

Select ProductCategoryID, ISNULL(ParentProductCategoryID, ' ') AS ParentProductCategoryID, Name, rowguid, ModifiedDate
from [SalesLT].[ProductCategory];

Select SalesOrderID, RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, ShipToAddressID, BillToAddressID, ShipMethod,
	ISNULL(CreditCardApprovalCode, ' ') AS CreditCardApprovalCode, SubTotal, TaxAmt, Freight, TotalDue, ISNULL(Comment, ' ') AS Comment, rowguid, ModifiedDate
from [SalesLT].[SalesOrderHeader];

-- 4. Clean NA values, there are none. 

-- 5. Create a table that has all customer and SalesOrderHeader information and call it CustomerOrder"
Select [SalesLT].[Customer].*, SalesOrderID, RevisionNumber, OrderDate,DueDate,ShipDate,Status,OnlineOrderFlag,SalesOrderNumber,PurchaseOrderNumber,AccountNumber,ShipToAddressID,BillToAddressID,ShipMethod,CreditCardApprovalCode,SubTotal,TaxAmt,Freight,TotalDue,Comment
into CustomerOrder
From [SalesLT].[Customer] 
Inner Join [SalesLT].[SalesOrderHeader] On Customer.CustomerID = SalesOrderHeader.CustomerID

-- 6. Create a table that Shows the CompanyName for James D. Kramer and Call it ""JamesCompany""
Select FirstName, MiddleName, LastName, CompanyName
into JamesCompany
FROM [SalesLT].[Customer]
WHERE  FirstName = 'James' AND LastName = 'Kramer'

-- 7. Create a table that Shows OrdeQty, the Name and the ListPrice of the order made by CustomerID 29485 and call it ""OrderbyID29485.""
Select Customer.CustomerID, Product.Name, Product.ListPrice, SalesOrderDetail.OrderQty
into OrderbyID29485
From [SalesLT].[Customer]
INNER JOIN  [SalesLT].[SalesOrderHeader] ON Customer.CustomerID = SalesOrderHeader.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
INNER JOIN [SalesLT].[Product] ON SalesOrderDetail.ProductID = Product.ProductID
WHERE SalesOrderHeader.CustomerID = '29485';

-- 8. Create a table that Shows all the addresses listed for ''Modular Cycle Systems'Systems' and call it ""AddressModular"", I couldn't find any data related to Modular Cycle Systems.
