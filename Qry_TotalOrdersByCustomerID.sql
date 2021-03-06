USE NORTHWND
DECLARE @Customer nchar(5);
SET @Customer = 'VINET';

Select
a.CustomerID,
Count(a.OrderID) AS Total_Orders,
b.ContactName,
b.Phone,
b.Country
From Orders a
Join Customers b ON a.CustomerID = b.CustomerID
--Where a.CustomerID = @Customer --Comment this out to see all customers totals--
Group By a.CustomerID,b.ContactName,b.Phone,b.Country
Order By Total_Orders DESC