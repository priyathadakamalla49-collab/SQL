show databases;
use ds;
show tables;
select * from emp;
create view dep as
select department,sum(salary) from emp group by department;
select * from dep;
create view city as
select name,city from emp;
drop view city;
create view minage as
select department,min(age) from emp group by department;
select * from minage;
create view hr_d as 
select * from emp where department = 'HR';
select * from hr_d;
select * from rating;
select * from t2;
select * from t3;
create view full as
select rating.*,t2.id,t2.percentage,t3.email from rating inner join t2 on rating.sno = t2.sno inner join t3 on t2.id = t3.id;
select * from full;
select * from college;
create view avgper as
select Student_name,Student_percentage from college where Student_percentage < (select avg(Student_percentage) from college);
select * from avgper;
