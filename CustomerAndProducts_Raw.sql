CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    City VARCHAR(50),
    State text,
    Zipcode INTEGER
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CreationDate TIMESTAMP,
    TotalDue NUMERIC(10,2),
    Status VARCHAR(20),
    CustomerID INTEGER,
    SalespersonID INTEGER
);

CREATE TABLE Product (
    ProductID INTEGER PRIMARY KEY,
    ProductCode VARCHAR(20),
    ProductName VARCHAR(50),
    Size INTEGER,
    Variety VARCHAR(30),
    Price NUMERIC(10,2),
    Status VARCHAR(20)
);

CREATE TABLE SalesPerson (
    SalespersonID INTEGER PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Zipcode INTEGER
);

CREATE TABLE OrderItem (
    OrderItemID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER
);