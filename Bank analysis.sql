create schema Bank;
use Bank;

#Print product, price, sum of quantity more than 5 sold during all three months.
select * from bank_inventory_pricing;
create view prod_price as
select Product, Price, sum(Quantity) from bank_inventory_pricing where Quantity >5 group by Product,Price;

#Print product, quantity , month and count of records for which estimated_sale_price is less than purchase_cost
select Product,Quantity, Month from bank_inventory_pricing where Estimated_sale_price <  purchase_cost group by  Product,Quantity, Month;

create schema cust_table;
use cust_table;
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, Name, City, Country)
VALUES 
    (1, 'John Smith', 'New York', 'USA'),
    (2, 'Alice Jones', 'London', 'UK'),
    (3, 'Bob Johnson', 'Paris', 'France'),
    (4, 'Mary Brown', 'Sydney', 'Australia'),
    (5, 'Tom Wilson', 'Tokyo', 'Japan');

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES 
    (1, 3, '2024-03-01'),
    (2, 1, '2024-03-02'),
    (3, 5, '2024-03-03'),
    (4, 2, '2024-03-04'),
    (5, 4, '2024-03-05'),
    (6, 1, '2024-03-06');
    
 #Retrieve all information about customers who have placed orders.

#List all orders along with customer information

#Retrieve all customers and their orders.
select c.CustomerID, c.Name,c.City, c.Country,
o.OrderID,o.OrderDate from customers as c left join orders as o
on c.CustomerID=o.CustomerID 
union
select c.CustomerID, c.Name,c.City, c.Country,
o.OrderID,o.OrderDate from customers as c right join orders as o
on c.CustomerID=o.CustomerID 
