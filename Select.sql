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


