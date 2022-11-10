insert into parking  values (nextval('parking_id_seq'), 'Free','Free Parking','Vitebsk, Lenina 26A');
insert into parking  values (nextval('parking_id_seq'), 'Pay','Pay Parking','Vitebsk, Lenina 26B');

select * from parking p ;

-- parking_user: id, login, password, fio, phone, card, role;
insert into parking_user values (nextval('parking_user_id_seq'), 'Den', '12345678', 'Борисов', 'Денис', 'Николаевич', '+3752912345678', '14523', 'Director');
insert into parking_user values (nextval('parking_user_id_seq'), 'Kolobok', 'qwerty', 'Овчинников', 'Алексей', 'Валерьевич', '+375294567891', '10000', 'Employer');
insert into parking_user values (nextval('parking_user_id_seq'), 'Lenusik', '0123', 'Петрова', 'Лена', 'Генадьевна', '+375291237894', '111122', 'Administrator');
insert into parking_user values (nextval('parking_user_id_seq'), 'Love', '987654', 'Иванова', 'Любовь', 'Николаевна', '+375294567898', '1111222', 'Administrator');
insert into parking_user values (nextval('parking_user_id_seq'), 'serega', 'serg', 'Васютин', 'Сергей', 'Денисович', '+3752912335678', '1111222', 'Client');
insert into parking_user values (nextval('parking_user_id_seq'), 'doctor', 'doc1988', 'Гончаров', 'Александр', 'Александрович', '+3752912445678', '1011322', 'Client');
insert into parking_user values (nextval('parking_user_id_seq'), '6ar6apuc', '6ar6apuc99', 'Лебедев', 'Дмитрий', 'Олегович', '+3752912366678', '1213332', 'Client');
insert into parking_user values (nextval('parking_user_id_seq'), 'S1LvaNT', '22051999', 'Потапов', 'Конмтантин', 'Сергеевич', '+375297894568', '101122', 'Client');
insert into parking_user values (nextval('parking_user_id_seq'), '3adym4uBbIu_boTuHoK', '0987654321', 'Самойленко', 'Александр', 'Николаевич', '+3752917775678', '100112', 'Client');
insert into parking_user values (nextval('parking_user_id_seq'), 'IT_FOREVER', '12345678', 'Сидоров', 'Максим', 'Иванович', '+3752944445678', '100012', 'Client');

select * from parking_user pu ;

--car: id, model, number, weight, parking_user_id;
insert into car  values (nextval('car_id_seq'), 'Mercedes-Benz S 500 4MATIC long', '0001AA-7', 2.7, 1);
insert into car  values (nextval('car_id_seq'), 'Porsche Cayenne Turbo III', 'A777AA-777', 2.93, 2);
insert into car  values (nextval('car_id_seq'), 'Kia Soul II', '1234AA-2', 1.89, 3);
insert into car  values (nextval('car_id_seq'), 'Tesla Model Y Long Range I', '2233AA-2', 2.4, 4);
insert into car  values (nextval('car_id_seq'), 'Kawasaki ZX-6 Ninja', '5678AA-2', 0.167, 5);
insert into car  values (nextval('car_id_seq'), 'Opel Corsa D', '1113AA-2', 1.55, 6);
insert into car  values (nextval('car_id_seq'), 'Ford F-650', '2222БA-4', 11, 7);
insert into car  values (nextval('car_id_seq'), 'Chevrolet Tahoe', '8989МA-5', 2.2, 8);
insert into car  values (nextval('car_id_seq'), 'Hyundai Equus II', '7373ГA-4', 2.5, 9);
insert into car  values (nextval('car_id_seq'), 'Volkswagen Transporter T5', '0235AA-2', 3.2, 10);

select * from car c  ;

-- parkig_place: floor, number, cost, car(id), parking(id);
insert into parking_place  values ( 1, 1, 0.0, 1, 2);
insert into parking_place  values ( 1, 2, 0.0, 2, 2);
insert into parking_place  values ( 1, 3, 0.0, 3, 2);
insert into parking_place  values ( 1, 4, 0.0, 4, 2);
insert into parking_place  values ( 2, 5, 0.0, 5, 1);
insert into parking_place  values ( 2, 1, 0.0, 6, 1);
insert into parking_place  values ( 1, 21, 1.5, 7, 2);
insert into parking_place  values ( 1, 22, 1.5, 8, 2);
insert into parking_place  values ( 2, 2, 0.0, 9, 1);
insert into parking_place  values ( 3, 1, 0.0, 10, 1);

select * from parking_place pp ;


-- orders: id, pp_floor, pp_number, date_from, date_to, overtime;
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 1);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 2);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 3);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 4);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 10:51:10', '2022-08-11 14:00:10', true, 2, 5);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 09:51:10', '2022-08-11 11:00:10', false, 2, 1);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 21);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 1, 22);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 2, 2);
insert into orders  values (nextval('orders_id_seq'), '2022-08-11 07:51:10', '2022-08-11 17:00:10', false, 3, 1);

select * from orders o ;

select * from car c where c.id in (select pp.car_id from parking_place pp where pp.parking_id = 1);