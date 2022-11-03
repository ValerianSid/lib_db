-- создание таблиц 

create table if not exists parking (
id serial primary key,
type varchar(64) not null,
name varchar(64),
adress varchar(256) not null
);

create table if not exists parking_user(
id serial primary key,
login varchar(64) not null,
password varchar(256) not null,
name varchar(32),
last_name varchar(32),
second_name varchar(32),
phone_number varchar(16),
card_number int4,
role varchar(32) not null
);

create table if not exists car(
id serial primary key,
model varchar(64),
number varchar(16) not null,
weight float4 not null,
parking_user_id int4 not null,
constraint parking_user_id_fk foreign key(parking_user_id) references parking_user(id)
);

create table if not exists parking_place(
floor int4 not null,
number int4 not null,
primary key (floor, number),
cost int4 not null,
car_id int4,
parking_id int4,
constraint car_id_fk foreign key(car_id) references car(id),
constraint parking_id_fk foreign key(parking_id) references parking(id)
);

create table if not exists orders(
id bigserial primary key,
date_from timestamp,
date_to timestamp,
overtime bool not null,
parking_place_floor int4 not null,
parking_place_number int4 not null,
foreign key(parking_place_floor, parking_place_number) references parking_place(floor, number)
);

drop table parking cascade;
drop table parking_user cascade;
drop table car cascade;
drop table parking_place cascade;
drop table orders cascade;