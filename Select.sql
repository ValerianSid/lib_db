select * from parking_place pp inner join car c on pp.car_id = c.id; 
select * from parking_place pp2 , car c2 where pp2.car_id = c2.id; 

insert into parking_place  values ( 1, 151, 0.0, null, 2);
insert into parking_place  values ( 1, 152, 0.0, null, 2);
insert into parking_place  values ( 1, 153, 0.0, null, 2);

select * from parking_place pp left join parking p on pp.parking_id = p.id where pp.car_id is null;
select * from parking_place pp , parking p where pp.parking_id = p.id and pp.car_id is null;

select * from parking_place pp full outer join parking p on pp.parking_id = p.id 
full outer join car c on c.id = pp.car_id  where pp.car_id is not null;