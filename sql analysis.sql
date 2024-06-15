select * FROM customer, orders;

create view cust_order as
select CustomerID, Name
from customer;

select * from cust_order;

-- horizontal view

create view horizontal_view as
select * from customer
where CustomerID between 1 and 2;

select * from horizontal_view;

-- vertical view

create view vertical_view as
select CustomerID, Name
from customer;

-- row/column subset

create view row_column_sub4 as
select CustomerID,City
from customer where CustomerID=3;

select * from row_column_sub4;

-- group view
create table group_emp(
emp_id int,
emp_name varchar(20),
emp_dep varchar(20));

insert into group_emp
values (101, "John", "CSE"),
(102,"Riya","ECE"),
(103,"diya","CSE"),
(104,"nithya","B.E"),
(105,"oviya","ECE");

select * from group_emp;

create view group_view1 as
select emp_dep,count(emp_dep) from group_emp
group by emp_dep;

select * from group_view1;

-- joined view

create view joined_view1 as 
select customer.CustomerID,customer.Name,orders.Item
from customer
join orders
on customer.CustomerID= orders.CustomerID;

select * from joined_view1;

create table Packing(
CustomerID int,
Pack_dep varchar(20),
pack_status varchar(20));

insert into Packing
values (1,"metal","not yet"),
(2,"fruits","done");
 
create view pack_view1 as
select customer.CustomerID, customer.Name, Packing.pack_status
from customer
inner join Packing
on customer.CustomerID=Packing.CustomerID;

select * from pack_view1;

create table group_emp3(
emp_id int,
emp_name varchar(20),
emp_dep varchar(20),
emp_dep_ID int,
UNIQUE index idx_emp_dep (emp_dep_ID));

SELECT * FROM group_emp3;

insert into group_emp3
values (106, "John", "CSE",1),
(102,"Riya","ECE",2),
(103,"diya","CSE",3),
(104,"nithya","B.E",4),
(105,"oviya","ECE",5);

SELECT * FROM group_emp3 where emp_dep_ID;

Alter table group_emp3 drop index idx_emp_dep;

select emp_dep,count(emp_dep) from group_emp3
group by emp_dep
having emp_dep="ECE";


-- practise
create schema case_end;
use case_end;
drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    department_name VARCHAR(50)
);

insert into employees
value (1, 'Alice', 101, 50000.00, '2023-01-01', 
case
when department_id =101 then 'HR'
when department_id =102 then 'sales'
end),
(2, 'Bob', 102, 60000.00, '2023-01-15',
case
when department_id =101 then 'HR'
when department_id =102 then 'sales'
end);

select * from employees;

create table books(
book_id int Primary Key, 
title varchar(30), 
author varchar(30), 
publication_year date, 
isbn_Users int);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

CREATE TABLE Checkouts (
    checkout_id INT PRIMARY KEY,
    user_id INT,
    book_id INT, -- Assuming there is a Books table with a book_id column
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) 
);

INSERT INTO Checkouts (checkout_id, user_id, book_id, checkout_date, return_date)
VALUES
    (1, 1, 1, '2023-04-01', '2023-04-15'),
    (2, 2, 2, '2023-04-05', '2023-04-20'),
    (3, 3, 3, '2023-04-10', '2023-04-25');

INSERT INTO Books (book_id, title, author, publication_year, isbn_Users)
VALUES
    (1, 'The Guide', 'R. K. Narayan', '1958-01-01', 111111111),
    (2, 'The God of Small Things', 'Arundhati Roy', '1997-01-01', 222222222),
    (3, 'A Suitable Boy', 'Vikram Seth', '1993-01-01', 333333333);

-- Write a query to retrieve the names of users who have checked out books.
select users.name
from users
join checkouts
on users.user_id=checkouts.user_id;

-- Write a query to find books that are currently checked out

select * from checkouts;
SELECT Books.title, Checkouts.checkout_date, Users.name AS borrower_name
FROM Books
JOIN Checkouts ON Books.book_id = Checkouts.book_id
JOIN Users ON Checkouts.user_id = Users.user_id
WHERE Checkouts.return_date IS NULL;

-- Write a query to calculate the average publication year of all books.
select books.title, publication_year from books
where (select avg(publication_year) from books);

-- Update the return date for a specific book that is checked out.
select * from checkouts;

UPDATE Checkouts
SET return_date = '2023-04-04' 
WHERE book_id = 1;

SELECT COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_name = "books";

