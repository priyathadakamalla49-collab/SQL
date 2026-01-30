use ds;
CREATE TABLE Emp (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Emp (EmpID, Name, Department, Salary, Age, City) VALUES
(1, 'Amit', 'HR', 35000, 29, 'Delhi'),
(2, 'Sneha', 'Finance', 48000, 32, 'Mumbai'),
(3, 'Ravi', 'IT', 55000, 28, 'Bangalore'),
(4, 'Priya', 'Sales', 40000, 30, 'Chennai'),
(5, 'Karan', 'Finance', 60000, 35, 'Delhi'),
(6, 'Meena', 'HR', 30000, 26, 'Pune'),
(7, 'Suresh', 'IT', 70000, 40, 'Hyderabad'),
(8, 'Divya', 'Sales', 42000, 27, 'Mumbai'),
(9, 'Vikram', 'Finance', 65000, 36, 'Bangalore'),
(10, 'Nisha', 'IT', 72000, 31, 'Delhi'),
(11, 'Rohit', 'HR', 31000, 25, 'Chennai'),
(12, 'Pooja', 'Sales', 38000, 29, 'Pune'),
(13, 'Anil', 'Finance', 58000, 34, 'Hyderabad'),
(14, 'Neha', 'IT', 64000, 33, 'Mumbai'),
(15, 'Rajesh', 'Sales', 45000, 37, 'Delhi'),
(16, 'Komal', 'HR', 33000, 28, 'Bangalore'),
(17, 'Deepak', 'Finance', 52000, 30, 'Chennai'),
(18, 'Swati', 'IT', 76000, 38, 'Pune'),
(19, 'Arjun', 'Sales', 47000, 29, 'Hyderabad'),
(20, 'Lakshmi', 'Finance', 61000, 32, 'Delhi'),
(21, 'Manoj', 'IT', 69000, 36, 'Bangalore'),
(22, 'Sakshi', 'Sales', 39000, 26, 'Mumbai'),
(23, 'Harish', 'HR', 29500, 24, 'Chennai'),
(24, 'Kavita', 'Finance', 57000, 35, 'Hyderabad'),
(25, 'Sunil', 'IT', 73000, 39, 'Delhi'),
(26, 'Ramesh', 'Sales', 46000, 33, 'Pune'),
(27, 'Jyoti', 'Finance', 59000, 31, 'Bangalore'),
(28, 'Ashok', 'IT', 71000, 34, 'Mumbai'),
(29, 'Tanvi', 'Sales', 41000, 27, 'Delhi'),
(30, 'Gaurav', 'HR', 34000, 29, 'Hyderabad');

-- BASIC SUB QUERIES
-- 1. Find employees whose salary is greater than the average salary of all employees.
select * from Emp where salary > (select avg(salary) from Emp);
-- 2. Find employees whose age is less than the youngest employee in the HR department.
select * from emp where age < (select min(age) from emp where department = 'HR');
-- 3. Find employees living in the same city as Ravi
select * from emp where city = (select city from emp where name = 'Ravi');
-- 4. Find employees with the same salary as Karan
select * from emp where salary = (select salary from emp where name = 'Karan');
-- 5. Find employees earning more than Sneha
select * from emp where salary > (select salary from emp where name = 'Sneha');
-- 6. Find employees working in the same department as Nisha
select * from emp where department = (select department from emp where name = 'Nisha');
-- 7. Find employees who live in the same cities as Finance department employees.
select * from emp where city in (select city from emp where department = 'Finance'); 
-- 8. Find employees older than any employee in the Sales department.
select * from emp where age > any (select age from emp where department = 'Sales');
-- 9. Find employees earning more than all employees in HR.
select * FROM emp where salary > all(select salary from emp where department = 'HR');
-- 10. Find employees working in a department where at least one employee earns more than
-- 70,000.
select * from emp where department in (select department from emp where salary > 70000); 
-- CORRELATED SUB QUERIES
-- 11. Find employees whose salary is greater than the average salary of their department.
select * from emp as e where salary > (select avg(salary) from emp where e.department = department);
-- 12. Find employees earning the maximum salary in their department.
select * from emp where salary in (select max(salary) from emp group by department);
-- 13. Find employees earning the minimum salary in their department.
select * from emp where salary in (select min(salary) from emp group by department);
-- 14. Find employees older than the average age of their department
select * from emp as e where age > (select avg(age) from emp as e2 where e.department = e2.department); 
-- 15. Find employees who have the same city as at least one of their department colleagues.
-- 16. Find the city with the maximum number of employees.
select city from emp group by city order by count(city) desc limit 1;
-- NESTED SUBQUERIES
-- 17. Find employees whose salary equals the second-highest salary in the company.
select salary from emp where salary = 
(select distinct salary from emp order by salary desc limit 1 offset 1);
-- 18. Find employees whose salary equals the third-highest salary in the company.
select * from emp where salary =
(select distinct salary from emp order by salary desc limit 1 offset 2);
-- 19. Find employees whose salary is greater than the average salary of employees in Delhi.
select * from emp where salary >
(select avg(salary) from emp where city = 'Delhi');
-- 20. Find employees who earn more than the average salary of employees who are older than
-- 30.
select * from emp where salary >
(select avg(salary) from emp where age > 30);
-- 21. Find employees who are younger than the oldest employee in Sales department.
select * from emp where age <
 (select max(age) from emp where department = 'sales');
-- 22. Find employees whose salary is greater than the average salary of Finance employees but
-- less than the maximum salary of IT employees.
select * from emp where salary > (select avg(salary) from emp where department = 'finance')
and salary < (select max(salary) from emp where department = 'IT');
-- 23. Find employees who belong to the department that has the least number of employees.
select * from emp where department in 
(select department from emp group by department having count(department) =
(select count(department) from emp group by department order by department asc limit 1));
-- 24. Find employees whose city has more employees than the city of Priya.
select * from emp where city in
(select city from emp group by city having count(city) >
(select count(city) from emp where city =
(select city from emp where name = 'priya')));
-- 25. Find employees who belong to the department where the average salary is greater than
-- 55,000.
select * from emp where department in (select department from emp group by department having avg(salary) > 55000);
-- 26. Find employees who earn more than the average salary of all employees but less than the
-- maximum salary of their department.
select * from emp e where salary > (select avg(salary) from emp) and salary < (select max(salary) from emp where department = e.department);
-- 27. Find employees whose salary is above the company average and age is below the company
-- average.
select * from emp where salary > (select avg(salary) from emp) and age < (select avg(age) from emp);
