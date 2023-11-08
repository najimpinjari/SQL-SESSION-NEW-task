use piramalemployee
-- Create Customers Table
CREATE TABLE Customers_1 (
    CustomerID INT  PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactNumber VARCHAR(255),
    Address VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers_1 (CustomerName, ContactNumber, Address) VALUES
('John Doe', '1234567890', '123 Street, City A'),
('Jane Smith', '9876543210', '456 Avenue, City B'),
('Alex Johnson', '5551234567', '789 Road, City C');

-- Create Orders Table
CREATE TABLE Orders_1 (
    OrderID INT  PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers_1(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders_1(CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2023-10-25', 150.00, 'Shipped'),
(2, '2023-10-26', 200.00, 'Pending'),
(3, '2023-10-27', 75.00, 'Delivered');


select * from Orders_1
select * from Customers_1


--Write a query to retrieve all the customers and their respective orders (if any).

SELECT * 
FROM Customers_1 C
LEFT JOIN Orders_1 O ON C.CustomerID = O.CustomerID;

--Write a query to retrieve all orders along with the corresponding customer information.

SELECT *
FROM Orders_1 O
LEFT JOIN Customers_1 C ON O.CustomerID = C.CustomerID;

--Write a query to retrieve the orders for a specific customer (e.g., Jane Smith).

SELECT *
FROM Orders_1 O
INNER JOIN Customers_1 C ON O.CustomerID = C.CustomerID
WHERE C.CustomerName = 'Jane Smith';

--Write a query to retrieve all customers who have not placed any orders.

SELECT * 
FROM Customers_1 C
LEFT JOIN Orders_1 O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;

--Write a query to retrieve all customers and their orders, sorting the result by customer name.

SELECT *
FROM Customers_1 C
LEFT JOIN Orders_1 O ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerName;

--Write a query to retrieve the total amount spent by each customer.

SELECT C.CustomerName, SUM(O.TotalAmount) AS TotalAmountSpent
FROM Customers_1 C
LEFT JOIN Orders_1 O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName;

--Write a query to retrieve the number of orders placed for each customer.

SELECT C.CustomerName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers_1 C
LEFT JOIN Orders_1 O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName;

--Write a query to retrieve the details of customers and their corresponding orders where the order status is 'Shipped'.

SELECT *
FROM Customers_1 C
INNER JOIN Orders_1 O ON C.CustomerID = O.CustomerID
WHERE O.Status = 'Shipped';


--Write a query to retrieve the details of customers who have placed orders worth more than $100.

SELECT C.*
FROM Customers_1 C
INNER JOIN Orders_1 O ON C.CustomerID = O.CustomerID
WHERE O.TotalAmount > 100


--Write a query to retrieve the details of customers and their orders placed on or after '2023-10-26'.

SELECT *
FROM Customers_1 C
INNER JOIN Orders_1 O ON C.CustomerID = O.CustomerID
WHERE O.OrderDate >= '2023-10-26';