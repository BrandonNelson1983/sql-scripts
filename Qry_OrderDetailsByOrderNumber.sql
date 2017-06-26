USE NORTHWND
DECLARE @OrderId int;
SET @OrderId = '10270'; --This is where you set the Order Number--
Select
a.OrderID,
a.ProductID,
b.ProductName,
c.Orderdate,
c.ShippedDate
From [Order Details] a
Join Products b ON a.ProductID = b.ProductID
Join Orders c ON a.OrderID = c.OrderID
Where a.OrderID = @OrderId