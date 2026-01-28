show databases;
create database emp;
use emp;
create table employee_details(Emp_id int,Emp_code char(6),Emp_Name varchar(100),Email varchar(150),Number bigint,Salary decimal(10,2),Is_Active boolean,DOB date,Joining_Date datetime,Profile_Description text,Rating float);
show tables;
insert into employee_details values(101,'EMP001','Ajith','ajith01@gmail.com',1234567821,65000.00,TRUE,'1997-02-12','2022-07-10 09:30:00','SQL Developer',5.2);
select * from employee_details;
insert into employee_details values(102,'EMP002','Vikram','vikram02@gmail.com',3421567234,88800.9999,TRUE,'1995-03-12','2021-09-12 05:20:01','AEM Developer', 4.88888888);
insert into employee_details values(103,'EMP003','Yash','yash@gmail.com','3424561234','99920.99',TRUE,'1991-09-12','2020-08-11 03:21:00','Data Scientist',9.9999999999);
