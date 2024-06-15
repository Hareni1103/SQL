create schema joins;
use joins;
select * from customer;
select * from orders;

-- Inner Join: Find all customers who have placed orders.
select customer.CustomerID,customer.Name,orders.OrderID
from customer
inner join orders
on customer.CustomerID = orders.CustomerID;

-- Left Join: Find all customers, even if they haven't placed any orders.
select c.CustomerID,c.Name,o.OrderID
from customer as c
left join orders as o
on c.CustomerID=o.CustomerID;

-- Right Join: Find all orders, even if the customer who placed the order isn't listed in the customers table.
SELECT c.CustomerID,c.Name,o.OrderID
FROM customer as c
right join orders as o
on c.CustomerID= o.CustomerID;

-- Full Outer Join: Find all customers and orders, regardless of whether there is a match in both tables.
SELECT c.CustomerID,c.Name,o.OrderID
FROM customer as c
left join orders as o
on c.CustomerID= o.CustomerID
UNION
SELECT c.CustomerID, c.Name, o.OrderID
FROM customer AS c
RIGHT JOIN orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL; 

-- Find all customers who have placed orders in the last month.
Select c.CustomerID,c.Name,o.OrderDate
from customer as c
inner join orders as o
on c.CustomerID=o.CustomerID
where month(o.OrderDate)=11;

SELECT c.CustomerID, c.Name, o.OrderDate
FROM customer as c
INNER JOIN orders as o ON c.CustomerID=o.CustomerID
WHERE o.OrderDate between "11/1/2023" and "11/15/2023";

-- Find all customers who have placed orders for more than one item.
select c.CustomerID,c.Name,count(distinct o.OrderID) as no_of_orders
from customer as c
inner join orders as o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.Name
having count(distinct o.OrderID) >1;

-- Find all customers who have placed orders for more than one item.
SELECT c.CustomerID, c.Name, COUNT(DISTINCT o.OrderID) AS NumberOfOrders
FROM customer AS c
INNER JOIN orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(DISTINCT o.OrderID) > 1;

-- Suppose you want to create a list of all possible combinations of customers and items, regardless of whether the customer has actually purchased that item. How can you use a cross join to achieve this?

select customer.Name ,orders.Item
from customer 
cross join orders;

-- Find pairs of customers who have ordered the same item, but are different customers.
SELECT c1.Name AS customer1, c2.Name AS customer2, o1.Item AS item
FROM customer c1
INNER JOIN Orders o1 ON c1.CustomerID = o1.CustomerID
INNER JOIN customer c2 ON c2.CustomerID = o1.CustomerID -- Corrected join condition
INNER JOIN Orders o2 ON o1.Item = o2.Item AND c1.CustomerID != c2.CustomerID;



