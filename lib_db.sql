-- создание таблиц архив
create table if not exists archive (
id bigserial primary key,
number int8
);

--создание таблицы автора
create table if not exists author (
	id bigserial primary key,
	first_name varchar(32),
	last_name varchar(32),
	middle_name varchar(32),
	birthday date
);

-- создание таблицы стихов
create table if not exists poem(
id bigserial primary key,
name varchar(128),
content text,
date timestamp,
a_id int8,
constraint a_id_fk foreign key (a_id) references author(id)
);

-- создание таблицы шкаф
create table if not exists book_case(
id bigserial primary key,
number int8,
ar_id int8,
constraint ar_id_fk foreign key (ar_id) references archive(id)
);

-- создание таблицы полка
create table if not exists shelf(
id bigserial primary key,
number int4,
bc_id int8,
constraint bc_id_fk foreign key (bc_id) references book_case(id)
);


-- создание таблицы книг
create table if not exists book(
id bigserial primary key,
name varchar(128),
date timestamp,
producer varchar(128),
number bigserial,
a_id int8,
s_id int8,
constraint a_id_fk foreign key (a_id) references author(id),
constraint s_id_fk foreign key (s_id) references shelf(id)
);

alter table book_case drop column ar_id cascade;
alter table book_case add column ar_id int8;
alter table book_case add constraint ar_id_fk foreign key (ar_id) references archive(id); 

drop table archive cascade;

create table authot_poem as select first_name, last_name from author; 
drop table authot_poem;

alter table archive alter column number set not null;

alter table book_case  alter column number set not null;
alter table book_case  alter column ar_id set not null;

alter table shelf alter column number set not null;
alter table shelf alter column bc_id set not null;

alter table book alter column name set not null;
alter table book alter column number set not null;
alter table book alter column a_id set not null;
alter table book alter column s_id set not null;

alter table poem alter column content set not null;

alter table author alter column last_name set not null;

--вставка данных

delete from poem;
truncate poem restart identity;
delete from author;
truncate author restart identity cascade;
delete from book;
truncate book restart identity;
delete from book_case;
truncate book_case restart identity cascade;
delete from archive;
truncate archive restart identity cascade;
delete from shelf;
truncate shelf restart identity cascade;

drop table archive cascade;
drop table author cascade;
drop table book cascade;
drop table poem cascade;
drop table book_case cascade;
drop table shelf cascade;

--новвая таблица от Ори
create table if not exists archive(
	id bigserial primary key,
	number varchar(128)
);

create table if not exists book_case(
	id bigserial primary key,
	number varchar(128),
	archive_id int8,
	constraint arc_id_fk foreign key (archive_id) references archive(id)
);

create table if not exists shelf(
	id bigserial primary key,
	number varchar(128),
	book_case_id int8,
	constraint book_case_id_fk foreign key (book_case_id) references book_case(id)
);

create table if not exists author(
	id bigserial primary key,
	first_name varchar(32),
	last_name varchar(32),
	middle_name varchar(32),
	birthdate date
);

create table if not exists book(
	id bigserial primary key,
	name varchar(128),
	producer varchar(128),
	date date,
	number int8,
	a_id int8,
	constraint a_id_fk foreign key (a_id) references author(id),
	shelf_id int8,
	constraint shelf_id_fk foreign key (shelf_id) references shelf(id)
);

create table if not exists poem(
	id bigserial primary key,
	name varchar(128),
	content text,
	date date,
	a_id int8,
	constraint a_id_fk foreign key (a_id) references author(id),
	book_id int8,
	constraint book_id_fk foreign key (book_id) references book(id)
);

-- очистка таблицы

truncate author restart identity cascade;
truncate archive restart identity cascade;

--заполнение таблицы

insert into author values (nextval('author_id_seq'), 'Лев','Толстой','Николаевич');
insert into author values (nextval('author_id_seq'), 'Энест','Хемингуэй');
insert into author values (nextval('author_id_seq'), 'Брэм','Стокер');
insert into author values (nextval('author_id_seq'), 'Мэри','Шелли');
insert into author values (nextval('author_id_seq'), 'Джордж','Оруэлл');
insert into author values (nextval('author_id_seq'), 'Говард','Лавкрафт');
insert into author values (nextval('author_id_seq'), 'Эдгар','По','Аллан');
insert into author values (nextval('author_id_seq'), 'Стивен','Кинг');
insert into author values (nextval('author_id_seq'), 'Густав','Майринк');

insert into poem (name, content, date, a_id) values ('Анна Коренина','Anna Corenina', '24.02.1870', 1);
insert into poem (name, content, date, a_id) values ('Старик и море','the Old man and the Sea', '24.02.1952', 2);
insert into poem (name, content, date, a_id) values ('Зелёные холмы Африки','Green Hills of Africa', '24.02.1935', 2);
insert into poem (name, content, date, a_id) values ('Дра́кула','Dracule', '24.02.1897', 3);
insert into poem (name, content, date, a_id) values ('Франкенштейн','Франкенштейн, или Современный Прометей', '24.02.1818', 4);
insert into poem (name, content, date, a_id) values ('1984','1984', '24.02.1949', 5);
insert into poem (name, content, date, a_id) values ('Скотный двор','Скотный двор', '24.02.1945', 5);
insert into poem (name, content, date, a_id) values ('Крысы в стенах','Крысы в стенах', '24.02.1923', 6);
insert into poem (name, content, date, a_id) values ('Золотой жук','Золотой жук', '24.02.1843', 7);
insert into poem (name, content, date, a_id) values ('Безнадёга','Безнадёга', '24.02.1996', 8);
insert into poem (name, content, date, a_id) values ('Оно','IT', '24.02.1986',8 );
insert into poem (name, content, date, a_id) values ('Голем','Безнадёга', '24.02.1914', 9);


insert into archive  values (nextval('archive_id_seq'), 'Numb.1');
insert into archive  values (nextval('archive_id_seq'), 'Numb.2');

insert into book_case values (nextval('book_case_id_seq'),'BC.N.1_1', 1);
insert into book_case values (nextval('book_case_id_seq'),'BC.N.1_2', 1);
insert into book_case values (nextval('book_case_id_seq'),'BC.N.2_1', 2);
insert into book_case values (nextval('book_case_id_seq'),'BC.N.2_2', 2);

insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.1_1_1', 1);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.1_1_2', 1);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.1_2_1', 2);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.1_2_2', 2);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.2_1_1', 3);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.2_1_2', 3);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.2_2_1', 4);
insert into shelf values (nextval('shelf_id_seq'),'Shelf.N.2_2_2', 4);

insert into book values (nextval('book_id_seq'),'Книга1','prod1','24.02.1952',1,1,1);
insert into book values (nextval('book_id_seq'),'Книга2','prod2','24.02.1935',2,2,1);
insert into book values (nextval('book_id_seq'),'Книга3','prod3','24.02.1897',2,2,1);
insert into book values (nextval('book_id_seq'),'Книга4','prod4','24.02.1818',3,3,1);
insert into book values (nextval('book_id_seq'),'Книга5','prod5','24.02.1949',4,4,1);
insert into book values (nextval('book_id_seq'),'Книга6','prod6','24.02.1945',5,5,1);
insert into book values (nextval('book_id_seq'),'Книга7','prod7','24.02.1923',5,5,1);
insert into book values (nextval('book_id_seq'),'Книга8','prod8','24.02.1843',6,6,1);
insert into book values (nextval('book_id_seq'),'Книга9','prod9','24.02.1996',7,7,1);
insert into book values (nextval('book_id_seq'),'Книга10','prod10','24.02.1986',7,8,1);
insert into book values (nextval('book_id_seq'),'Книга11','prod11','24.02.1914',8,8,1);

update author set birthdate ='28.08.1828' where last_name = 'Толстой';
update author set birthdate ='02.06.1961' where last_name = 'Хемингуэй';
update author set birthdate ='8.11.1847' where last_name = 'Стокер';
update author set birthdate ='30.08.1797' where last_name = 'Шелли';
update author set birthdate ='25.06.1903' where last_name = 'Оруэлл';
update author set birthdate ='20.08.1890' where last_name = 'Лавкрафт';
update author set birthdate ='19.01.1809' where last_name = 'По';
update author set birthdate ='21.09.1947' where last_name = 'Кинг';
update author set birthdate ='19.01.1868' where last_name = 'Майринк'; 


select * from poem p where p."date" > '01.01.1900' and p."date" < '01.01.1951';

select p."name" , a.first_name , a.last_name , p."date"  from poem p, author a  where p."date" > '01.01.1900' and p."date" < '01.01.1951' and p.a_id = a.id; 

select * from book b where b.producer = 'prod3';

select a.last_name , p."name"  from author a , poem p where a.last_name = 'Кинг' and p.a_id = a.id; 

select * from poem p where p.a_id in (select a.id from author a where a.last_name  = 'Кинг');

select * from poem p where p.book_id in (select b.id from book b where b.producer  ='prod7');

select * from poem p where p.date < '01.01.1951' and p.date > '01.01.1901';

select * from poem p where p.book_id in (select b.id from book b where b.producer = 'prod3');

--выбор всех авторов из второго архива

select * from author a where a.id in (select a_id  from book b where b.shelf_id  in (
select s.id from shelf s where s.book_case_id in (
select bc.id from book_case bc where bc.archive_id = 2))); 

-- выбор всех книг 18 века из первого архива

select *from poem p where p.date >'01.01.1801' and p.date < '01.01.1900' and p.book_id in(
select b.id  from book b where b.shelf_id  in (
select s.id from shelf s where s.book_case_id in (
select bc.id from book_case bc where bc.archive_id = 1)));

--выбор всех произведений авторов 18 века из первого архива

select * from poem p where p.a_id in(
select a.id from author a where a.birthdate > '01.01.1801' and a.birthdate <'01.01.1900')
and p.book_id in(
select b.id  from book b where b.shelf_id  in (
select s.id from shelf s where s.book_case_id in (
select bc.id from book_case bc where bc.archive_id = 1)));

-- выбор всех произведений авторов 18 века из первого архива

select * from poem p where p.a_id in(
select a.id from author a where a.birthdate > '01.01.1801' and a.birthdate <'01.01.1900')
and p.book_id in(
select b.id  from book b where b.shelf_id  in (
select s.id from shelf s where s.book_case_id in (
select bc.id from book_case bc where bc.archive_id in (
select id from archive a2 where number = 'Numb.1'))));
