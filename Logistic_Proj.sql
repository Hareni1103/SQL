use logistic_project;
create table Employee_details(
Emp_ID int primary key,
Emp_Name varchar(30),
Emp_Branch varchar(15),
Emp_Designation varchar(40),
Emp_Addr varchar(100),
Emp_Cont_No varchar(10));

select * from employee_details;

create table Membership(
M_ID int primary key,
Start_Date date,
End_Date date);

select * from membership;

create table Customer_details(
Cust_ID int(4) primary key,
Cust_Name varchar(30),
Cust_Email_ID varchar(50),
Cust_Cont_No varchar(10),
Cust_Addr varchar(100),
Cust_type varchar(30),
Membership_M_ID int,
foreign key (Membership_M_ID) references membership(M_ID));

select * from customer_details;

Create table Payment(
Payment_ID varchar(40) primary key,
Amount int,
Payment_Details varchar(10),
Payment_Date Date,
Payment_Mode varchar(25),
Shipment_SH_ID varchar(6),
Shipment_Client_C_ID int(4));

alter table payment add foreign key(Shipment_SH_ID) references shipment_details(SD_ID);
alter table payment add foreign key(Shipment_Client_C_ID) references shipment_details(Customer_Cust_ID);

select * from payment;

Create table Shipment_Details(
SD_ID varchar(6) primary key,
SD_Content varchar(40),
SD_Domain varchar(15),
SD_Type varchar(15),
SD_Weight varchar(10),
SD_Charges Int(10),
SD_Addr varchar(100),
DS_Addr varchar(100),
Customer_Cust_ID int(4),
foreign key (Customer_Cust_ID) references customer_details(Cust_ID));

select * from Shipment_Details;

create table status(
Current_ST varchar(15),
Sent_Date date,
Delivery_Date date,
SH_ID Varchar(6) primary key);

alter table status change Sent_Date Sent_Date text;
alter table status change Delivery_Date Delivery_Datecustomer_details text;

select * from status;

create table Empl_Manages_Shipment(
Employee_E_ID int(5),
Shipment_SH_ID varchar(6),
Status_SH_ID varchar(6),
foreign key (Employee_E_ID) references employee_details(Emp_ID),
foreign key(Shipment_SH_ID) references shipment_details(SD_ID),
foreign key(Status_SH_ID) references status(SH_ID));
