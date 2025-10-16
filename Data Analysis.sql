--Finding Duplicate Rows--
select Customers.CustomerID,
customers.firstname, customers.lastname,
count(1) as num_orders
from customers
	join orders on customers.customerid = orders.customerID
group by customers.customerID,
customers.firstname,
customers.lastname
order by num_orders desc

--Finding Duplicate Rows using Having Clause--

Select FirstName, LastName, Count(1)
from customers
Group by FirstName, LastName
Having Count(1) > 1

--Finding duplicates identifying the truly unique records--

Select FirstName, LastName, City, State, zipcode, Count(1)
from customers
group by FirstName, LastName, City, State, Zipcode
having count(1) > 1

--Total due for each customer--

Select Customers.CustomerID, FirstName, LastName, Totaldue
from customers
	Join orders on 
	Customers.CustomerID = Orders.customerid
Group by customers.customerID, FirstName, LastName, totaldue
order by customers.customerID

--Total due for each customerID top 10--

Select Customers.customerID, FirstName, LastName, Sum(totaldue)
from customers
	join orders on Customers.customerid = Orders.customerid
group by customers.customerid, firstname, lastname
order by Sum(totaldue) desc
limit 10

--Add new Product--

insert into product (
ProductID,
ProductCode,
ProductName,
Size,
Variety,
Price, 
Status
)
Values (
17,
'MWORG64',
'',
64,
'Orange',
'0.00',
'Active'
);

--Finding Missing Values--

Select ProductCode
From Product
Where ProductName ='';

Select *
from Product
Where ProductID = 17;

Select CustomerID, FirstName, LastName
from customers
where State is null

Select CustomerID, FirstName, LastName
from customers
where State is not null

--Finding possible inaccurate data values--

Select OrderItem.orderID, Orders.Totaldue, Sum(Price * Quantity) as NewTotaldue
from OrderItem
	Join Product on OrderItem.ProductID = Product.ProductID
	Join Orders on OrderItem.OrderID = Orders.OrderID
Group by OrderItem.OrderID, Orders.TotalDue
Order by OrderID

--Working and filtering data by Dates--

Select Extract(year from CreationDate) as Year,
Extract(month from CreationDate) as Month,
Extract(day from CreationDate) as Day
from Orders

select OrderID, CreationDate
from orders
where Extract(month from CreationDate) = 5
and Extract(Year from CreationDate) = '2016'

Select OrderID, CreationDate
from Orders
where CreationDate between '2016-05-01' and '2016-05-31'
order by CreationDate

Select OrderID, CreationDate
from orders
Where Extract(Year from CreationDate) > (extract(year from now())-10);

--Compare Year--

Select OrderId, extract(Year from Creationdate) as Order_Year, 
extract(month from Creationdate) as Order_Month, 
Totaldue, status
from orders
where extract(Year from Creationdate) = 2015
Order by order_month, order_year

--Replacing Product Code--

Select ProductCode,
Replace(ProductCode, 'BLU', 'BLE') as NewProductCode
from product

--Total Number of customers that have actually ordered something--

Select Count(Distinct CustomerID)
from Orders;

--Average total due by state--

Select State,
  AVG(TotalDue) as Avg_Due,
  MIN(TotalDue) as Min_Due,
  MAX(TotalDue) as Max_Due,
  SUM(TotalDue) as Total_Sales
from Customers C
  Join Orders O on O.CustomerID = C.CustomerID
Group by State
Order by Avg_Due desc

--Create View--

Create View V_CustomerOrderSymmary as
Select State,
  AVG(TotalDue) as Avg_Due,
  MIN(TotalDue) as Min_Due,
  MAX(TotalDue) as Max_Due,
  SUM(TotalDue) as Total_Sales
from Customers C
  Join Orders O on O.CustomerID = C.CustomerID
Group by State

--Add a new customer to the customers table--

Insert into Customers(
CustomerID,
FirstName,
LastName,
City,
State,
Zipcode
)
Values(
'1100',
'Carol',
'Smith',
'Little Rock',
'Ar',
'72209'
)