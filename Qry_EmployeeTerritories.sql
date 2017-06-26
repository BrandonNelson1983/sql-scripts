USE NORTHWND
DECLARE @Emp int;
SET @Emp = '9';

Select
a.EmployeeID AS EmpID,
a.FirstName,
a.LastName,
a.LastName + ', ' + a.FirstName AS FullName,
a.Title,
b.TerritoryID,
c.TerritoryDescription AS Territory
From Employees a
Join EmployeeTerritories b ON a.EmployeeID = b.EmployeeID
Join Territories c ON b.TerritoryID = c.TerritoryID
Where a.EmployeeID = @Emp
Order By c.TerritoryID ASC