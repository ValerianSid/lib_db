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


insert into author values(nextval('author_id_seq'), 'Лев', 'Толстой', 'Николаевич', '09.09.1828');
insert into archive values(nextval('archive_id_seq'), '1');
insert into author (last_name) values('Народ');



insert into author values (nextval('author_id_seq'), 'Энест','Хемингуэй');
insert into poem (name, content, date, a_id) values ('Старик и море','the Old man and the Sea', '24.02.1952', 2);
insert into poem (name, content, date, a_id) values ('Зелёные холмы Африки','Green Hills of Africa', '24.02.1935', 2);

insert into author values (nextval('author_id_seq'), 'Брэм','Стокер');
insert into poem (name, content, date, a_id) values ('Дра́кула','Dracule', '24.02.1897', 3);

insert into author values (nextval('author_id_seq'), 'Мэри','Шелли');
insert into poem (name, content, date, a_id) values ('Франкенштейн','Франкенштейн, или Современный Прометей', '24.02.1818', 4);

insert into author values (nextval('author_id_seq'), 'Джордж','Оруэлл');
insert into poem (name, content, date, a_id) values ('1984','1984', '24.02.1949', 5);
insert into poem (name, content, date, a_id) values ('Скотный двор','Скотный двор', '24.02.1945', 5);

insert into author values (nextval('author_id_seq'), 'Говард','Лавкрафт');
insert into poem (name, content, date, a_id) values ('Крысы в стенах','Крысы в стенах', '24.02.1923', 6);


insert into author values (nextval('author_id_seq'), 'Эдгар','По','Аллан');
insert into poem (name, content, date, a_id) values ('Золотой жук','Золотой жук', '24.02.1843', 7);

insert into author values (nextval('author_id_seq'), 'Стивен','Кинг');
insert into poem (name, content, date, a_id) values ('Безнадёга','Безнадёга', '24.02.1996', 8);
insert into poem (name, content, date, a_id) values ('Оно','IT', '24.02.1986', 8);

insert into author values (nextval('author_id_seq'), 'Густав','Майринк');
insert into poem (name, content, date, a_id) values ('Голем','Безнадёга', '24.02.1914', 9);


insert into archive  values (nextval('archive_id_seq'), '1');
insert into archive  values (nextval('archive_id_seq'), '2');


insert into book_case values (nextval('book_case_id_seq'),'1', 1);
insert into book_case values (nextval('book_case_id_seq'),'2', 1);
insert into book_case values (nextval('book_case_id_seq'),'1', 2);
insert into book_case values (nextval('book_case_id_seq'),'2', 2);

insert into shelf values (nextval('shelf_id_seq'),'11', 1);
insert into shelf values (nextval('shelf_id_seq'),'12', 1);
insert into shelf values (nextval('shelf_id_seq'),'21', 2);
insert into shelf values (nextval('shelf_id_seq'),'22', 2);
insert into shelf values (nextval('shelf_id_seq'),'11', 1);
insert into shelf values (nextval('shelf_id_seq'),'12', 1);
insert into shelf values (nextval('shelf_id_seq'),'21', 2);
insert into shelf values (nextval('shelf_id_seq'),'22', 2);
