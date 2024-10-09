CREATE DATABASE TechShop;
use TechShop;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(10,1),
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(100,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(150,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT   

);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(300,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATE NOT NULL
);


INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Sarthak', 'Londhey', 'sarthak.londhey@gmail.com', '9826996450', 'A1-806, Avasa Township, Indore, Madhya Pradesh'),
('Ramesh', 'Gupta', 'rameshgupta@example.com', '8765432109', '456, Vijay Nagar, Bhopal, Madhya Pradesh'),
('Suresh', 'Patel', 'sureshpatel@example.com', '7654321098', '789, Old City, Jaipur, Rajasthan'),
('Dinesh', 'Verma', 'dineshverma@example.com', '6543210987', '1011, New Colony, Delhi, Delhi'),
('Rajesh', 'Singh', 'rajeshsingh@example.com', '5432109876', '1234, Model Town, Mumbai, Maharashtra'),
('Ganesh', 'Kumar', 'ganeshkumar@example.com', '4321098765', '5678, Banjara Hills, Hyderabad, Telangana'),
('Mahesh', 'Tiwari', 'maheshtiwari@example.com', '3210987654', '9012, Indiranagar, Bengaluru, Karnataka'),
('Narendra', 'Mishra', 'narendramishra@example.com', '2109876543', '1314, Salt Lake City, Kolkata, West Bengal'),
('Pradeep', 'Chauhan', 'pradeepchauhan@example.com', '1098765432', '1516, Beach Road, Chennai, Tamil Nadu'),
('Sanjeev', 'Bhatt', 'sanjeevbhatt@example.com', '9876543210', '1718, MG Road, Kochi, Kerala');

select * from Customers;

INSERT INTO Products (ProductName, Description, Price) VALUES
('iPhone 14 Pro', '6.1-inch Super Retina XDR display, A16 Bionic chip, 12MP dual camera system', 129999.00),
('Samsung Galaxy S23 Ultra', '6.8-inch Dynamic AMOLED 2X display, Snapdragon 8 Gen 2, 200MP camera', 119999.00),
('OnePlus 11', '6.7-inch Fluid AMOLED display, Snapdragon 8 Gen 2, 50MP camera', 59999.00),
('Xiaomi 13 Pro', '6.7-inch AMOLED display, Snapdragon 8 Gen 2, 50MP camera', 69999.00),
('Google Pixel 7 Pro', '6.7-inch LTPO OLED display, Google Tensor G2, 50MP camera', 84999.00),
('MacBook Pro M2', '13.3-inch Liquid Retina XDR display, M2 chip, 8GB RAM, 256GB SSD', 149999.00),
('Dell XPS 13', '13.4-inch InfinityEdge display, Intel Core i7-13700H, 16GB RAM, 512GB SSD', 129999.00),
('Lenovo ThinkPad X1 Carbon', '14-inch OLED display, Intel Core i7-13600H, 16GB RAM, 512GB SSD', 139999.00),
('HP Spectre x360', '13.3-inch AMOLED display, Intel Core i7-13600H, 16GB RAM, 512GB SSD', 129999.00),
('Acer Predator Helios 16', '16-inch IPS display, Intel Core i9-13900HX, 32GB RAM, 2TB SSD', 179999.00);

select * from Products;

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-01-25', 129999.00),
(2, '2023-04-01', 59999.00),
(3, '2023-08-10', 69999.00),
(4, '2023-11-15', 149999.00),
(5, '2023-12-20', 119999.00),
(6, '2024-01-25', 84999.00),
(7, '2024-05-01', 129999.00),
(8, '2024-06-05', 139999.00),
(9, '2024-07-10', 179999.00),
(10, '2024-08-24', 129999.00);

select * from Orders;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(100, 10, 1),
(101, 11, 1),
(102, 12, 1),
(103, 13, 1),
(104, 14, 1),
(105, 15, 1),
(106, 16, 1),
(107, 17, 1),
(108, 18, 1),
(109, 19, 1);

select * from OrderDetails;

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(10, 10, '2023-12-31'),
(11, 15, '2023-12-31'),
(12, 20, '2023-12-31'),
(13, 5, '2023-12-31'),
(14, 8, '2023-12-31'),
(15, 12, '2023-12-31'),
(16, 7, '2023-12-31'),
(17, 11, '2023-12-31'),
(18, 6, '2023-12-31'),
(19, 9, '2023-12-31');

select * from Inventory;



--Task-2
--1
SELECT FirstName, LastName, Email 
FROM Customers;

--2
SELECT o.OrderID, o.OrderDate, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--3
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Ayush', 'Agrawal', 'ayush.agrawal@example.com', '1234567890', '456, Sudama Nagar, Indore, Madhya Pradesh');

select * from Customers;

--4
UPDATE Products
SET Price = Price * 1.10;

select * from Products;

--5
DELETE FROM OrderDetails
WHERE OrderID = 104;

select * from OrderDetails;

--6
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2024-09-20', 79999.00);

select * from Orders;

--7
UPDATE Customers
SET Email = 'newemail@example.com',
    Address = '1000, New Address, City, State'
WHERE CustomerID = 3;

select * from Customers;

--8
update OrderDetails set OrderID=112 where OrderDetailID=162;


INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(109, 19, 1);

UPDATE Orders
SET TotalAmount = (
    SELECT (od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);

select * from Orders;

--9
DECLARE @CustomerID INT = 6
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = @CustomerID
);
DELETE FROM Orders
WHERE CustomerID = @CustomerID;

select * from OrderDetails;

--10
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Smartwatch X200', 'A high-end smartwatch with various health tracking features and a sleek design.', 19999.00);

select * from Products;

--11
ALTER TABLE Orders
ADD Status VARCHAR(50);

UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 100;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 101;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 102;
UPDATE Orders SET Status = 'Delivered' WHERE OrderID = 103;
UPDATE Orders SET Status = 'Processing' WHERE OrderID = 106;
UPDATE Orders SET Status = 'Cancelled' WHERE OrderID = 107;
UPDATE Orders SET Status = 'Cancelled' WHERE OrderID = 108;
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 109;
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 112;
select * from Orders;

DECLARE @OrderID INT = 101
DECLARE @NewStatus VARCHAR(50) = 'shipped'
UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID;
select * from Orders;

--12
ALTER TABLE Customers
ADD OrderCount INT DEFAULT 0;

UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

select * from Customers;


--Task 3
--1
SELECT O.OrderID, O.OrderDate, O.TotalAmount, C.FirstName, C.LastName, C.Email, C.Phone
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID;

--2
SELECT P.ProductName, SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM OrderDetails AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName;

--3
SELECT C.FirstName, C.LastName, C.Email, C.Phone
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone;

--4
SELECT top 1 p.ProductName, 
       SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Inventory i ON p.ProductID = i.ProductID
WHERE i.QuantityInStock > 0
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

--5
ALTER TABLE Products
ADD Categories VARCHAR(255);
UPDATE Products
SET Categories = 'Smartphones'
WHERE ProductID IN (10, 11, 12, 13, 14);  
UPDATE Products
SET Categories = 'Laptops'
WHERE ProductID IN (15, 16, 17, 18, 19);  
UPDATE Products
SET Categories = 'Smartwatches'
WHERE ProductID = 20;  

SELECT ProductName,
       Categories AS CategoryName
FROM Products;

--6
SELECT c.FirstName,
       c.LastName,
       AVG(o.TotalAmount) AS AverageOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--7
SELECT o.OrderID,
       c.FirstName,
       c.LastName,
       c.Email,
       c.Phone,
       o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount = (
    SELECT MAX(TotalAmount)
    FROM Orders
);

--8
SELECT p.ProductName,
       COUNT(od.OrderID) AS NumberOfOrders
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

--9
DECLARE @ProductName NVARCHAR(255) = 'iPhone 14 Pro';

SELECT DISTINCT c.CustomerID,
                c.FirstName,
                c.LastName,
                c.Email,
                c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;

--10
DECLARE @StartDate DATE = '2023-01-01';  
DECLARE @EndDate DATE = '2024-06-30';    

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;


--Task 4
--1
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, c.Address
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--2
SELECT SUM(QuantityInStock) AS TotalProductsAvailable
FROM Inventory;

--3
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE Status IN ('Delivered', 'Shipped');

--4
DECLARE @Categories VARCHAR(50) = 'Laptops';
SELECT p.Categories, AVG(od.Quantity) AS AvgQuantityOrdered
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE p.Categories = @Categories  
GROUP BY p.Categories;

--5
DECLARE @customerID INT = 4;
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, SUM(o.TotalAmount) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = @customerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--6
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;

--7
SELECT top 1 p.Categories, SUM(od.Quantity) AS TotalQuantityOrdered
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Categories
ORDER BY TotalQuantityOrdered DESC;

--8
SELECT TOP 1 C.FirstName, C.LastName, SUM(OD.Quantity * P.Price) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.FirstName, C.LastName
ORDER BY TotalSpent DESC;

--9
SELECT C.CustomerID, C.FirstName, C.LastName, AVG(O.TotalAmount) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

--10
select FirstName, LastName, OrderCount from Customers
order by ordercount desc;



