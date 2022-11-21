select * from parking_place pp inner join car c on pp.car_id = c.id; 
select * from parking_place pp2 , car c2 where pp2.car_id = c2.id; 

insert into parking_place  values ( 1, 151, 0.0, null, 2);
insert into parking_place  values ( 1, 152, 0.0, null, 2);
insert into parking_place  values ( 1, 153, 0.0, null, 2);

select * from parking_place pp left join parking p on pp.parking_id = p.id where pp.car_id is null;
select * from parking_place pp , parking p where pp.parking_id = p.id and pp.car_id is null;

select * from parking_place pp full outer join parking p on pp.parking_id = p.id 
full outer join car c on c.id = pp.car_id  where pp.car_id is not null;


create function mark_overtime() returns orders as 
'update orders 
set overtime = true
where date_to < now()
returning orders'
language sql;

select mark_overtime();

create function update_date(ord orders) returns timestamp as 
$$select $1.date_to + Interval '1 DAY';$$
language sql;


select update_date(row(o.id, null, date_to, null, null, null)) from orders o where o.parking_place_floor = 1; 


create or replace function new_pp(pp integer) returns parking_place as
'update parking_place 
set parking_id = 2,
floor = 4
where number = pp and parking_id is null;
select * from parking_place where number = pp and floor = 4'
language sql;

select new_pp(pp.number) from parking_place pp ; 


create function up_date(num int8) returns void as
$BODY$
declare
d date;
begin
select o.date_to from orders o where o.id = num into d; 
if d < now() then 
update orders set overtime = true where o.id = num;
end if;
end;
$BODY$
language plpgsql;

create function new_up_date(int8) returns void as
$BODY$
declare
temp boolean;
begin
select overtime from orders o where o.id = $1 into temp;
if temp = true then
update orders 
set overtime = false,
date_to = now() + interval '1 DAY'
where id = $1;
end if;
end;
$BODY$
language plpgsql;

select new_up_date(o.id) from orders o; 

create function make_overtime_true(int8) returns void as
$BODY$
declare
temp boolean;
begin
select overtime from orders o where o.id = $1 into temp;
if temp = false then
update orders 
set overtime = true,
date_to = now() - interval '1 DAY'
where id = $1;
end if;
end;
$BODY$
language plpgsql;

select make_overtime_true(o.id) from orders o; 

create or replace function make_place_free() returns setof orders as
$body$
declare temp orders;
begin 
for temp in select * from orders where overtime = true 
loop 
update orders set overtime = false,
date_to = null 
where orders.id = temp.id;
update parking_place set car_id = null 
where floor = temp.parking_place_floor and number = temp.parking_place_number;
return next temp;
end loop;
end;
$body$
language plpgsql;

select make_place_free();

create or replace function make_place_free_new() returns setof orders as
$body$
declare temp orders;
begin 
for temp in select * from orders where overtime = true 
loop 
update orders set overtime = false,
date_to = null 
where orders.id = temp.id;
update parking_place set car_id = null 
where floor = temp.parking_place_floor and number = temp.parking_place_number;
select t.parking_place_floor, t.parking_place_number from temp t;
end loop;
end;
$body$
language plpgsql;

select make_place_free_new();

create index idx_parking_user_login
on parking_user(login);

explain select * from parking_user pu where login = 'Den';
select * from parking_user pu where login = 'Den';

select parking_place_number, parking_place_floor,date_to from orders
group by date_to, parking_place_number, parking_place_floor 
order by date_to;

select date_to, count(*) from orders
group by date_to; 

select "role", count(*)  from parking_user
group by "role";