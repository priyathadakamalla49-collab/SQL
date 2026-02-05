use ds;
show tables;
select * from insta_post;
delimiter $$
create procedure user(in a int)
begin
select * from insta_post where likes > a;
end $$
delimiter ;
call user(300);
delimiter $$
create procedure lcom(a int)
begin
select * from insta_post where comments < a;
end $$
delimiter ;
call lcom(200);
delimiter $$
create procedure likes(out a int)
begin
select * from insta_post where likes > 150;
end $$
delimiter ;
call likes(@c);
delimiter $$
create procedure hyb(in a int, out b int)
begin
select * from insta_post where comments > a;
end $$
delimiter ;
call hyb(60,@f);
delimiter $$
create procedure comb(inout s int)
begin
select * from insta_post where likes < s;
end $$
delimiter ;
set @s = 250;
call comb(@s);
