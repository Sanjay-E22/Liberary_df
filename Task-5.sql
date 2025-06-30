-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert Customers
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

-- Insert Orders
INSERT INTO Orders (OrderID, CustomerID, OrderAmount) VALUES
(101, 1, 250.00),
(102, 1, 150.00),
(103, 2, 400.00),
(104, 5, 100.00); -- Note: CustomerID 5 does not exist in Customers
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderAmount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderAmount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderAmount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
