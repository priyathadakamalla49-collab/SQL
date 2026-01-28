show databases;
use ds;
show tables;
create table college(
Student_id int unique auto_increment,
Student_code char(6) unique,
Student_Name varchar(65) not null,
Student_Course varchar(45) default 'CSE',
Student_Percentage float check (Student_Percentage > 35.5 and Student_Percentage <= 100))auto_increment = 101;
set sql_safe_updates = 0;
desc college;
insert into college(Student_code,Student_Name,Student_Course,Student_Percentage) values('COL001','Ajith','Mech',55.4);
select * from college;
insert into college(Student_code,Student_Name,Student_Course,Student_Percentage) values('COL002','Vikram','Civil',63.7);
insert into college(Student_code,Student_Name,Student_Percentage) values('COL003','Murari',87);
insert into college(Student_code,Student_Name,Student_Course,Student_Percentage) values ('COL004','Yash','CSE',99),('COL005','Bahu','EEE',63);
delete from college where Student_code = 'COL002';
set autocommit = 0;
rollback;