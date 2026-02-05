use ds;
create table trigger1(acc int,name varchar(100),branch varchar(100),bal float,Phone Bigint);
insert into trigger1 values(1,'Bob','Jublihills',-100,8976544278289);
create table trigger2(History varchar(100),DOT datetime default now());
select * from trigger1;
select * from trigger2;
delimiter $$
create trigger t1
after insert on trigger1
for each row
begin
insert into trigger2 (History) values ('Successfully New Account Created');
end $$
delimiter ;
insert into trigger1 values(2,'Mahesh','Banjara',50,32483297427),(3,'Yash','Karnataka',10000,7183261983719);
set sql_safe_updates = 0;
update trigger1 set name = 'Mahi' where name='Mahesh';
delimiter $$
create trigger t2
after update on trigger1
for each row
begin
insert into trigger2(History) values('Succesfully Record is updated');
end $$ 
delimiter ; 
update trigger1 set bal = 1 where acc = 1;
delimiter $$
create trigger t3
after delete on trigger1
for each row
begin
insert into trigger2(History) values('Tata Bye Bye');
end $$
delimiter ;
delete from trigger1 where name = 'Bob';

delimiter $$
create trigger t4
before insert on trigger1
for each row
begin
insert into trigger2(History) values ('Balance should be more than 500');
end $$
delimiter ;
insert into trigger1 values(4,'Singha','Kerala',2,49832412301);