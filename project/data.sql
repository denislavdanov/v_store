use v_store;
INSERT INTO customer(id, egn, first_name, last_name, phone, email, street,city, zip_code)
values(100101,9905041823,'Denislav','Danov', 0878273764, 'denislavdanov@abv.bg','Peio Yavorov','Mezdra','3100' ),
(100102,9706082131,'Jivko','Jivkov', 0878938427, 'JivkoJivkov@abv.bg','Ivan Vazov','Sofia','1564'),
(100103,9410129322,'Petar','Sotirov', 0878152514, 'PetarSotirov@abv.bg','Pliska','Varna','1243'),
(100104,9129113929,'Ivan','Ivanov', 0878797968, 'IvanIvanov@abv.bg','Vuzrojdenie','Burgas','4000'),
(100105,5108082737,'Snejina','Petkova', 087382716, 'SnejinaPetkova@abv.bg','Patriarh Evtimii','Mezdra','3100');

INSERT INTO store(store_id, store_name, phone, email, street, city, website)
values(110101,'Vivacom', 029877474, 'vivacom@gmail.com', 'Aleksandur Stamboliiski' , 'Sofia','vivacom.bg'),
(110102,'Vivacom', 092661110, 'vivacom@gmail.com', 'Oborishte' , 'Vraca','vivacom.bg'),
(110103,'Vivacom', 091092332, 'vivacom@gmail.com', 'Hristo Botev' , 'Mezdra','vivacom.bg');

INSERT INTO staff(staff_id, first_name, last_name, phone, email,store_id, manager_id)
values(120101, 'Georgi', 'Petrov', '0878685632','georgipetrov@gmail.com',110102,130101),
(120102, 'Petkan', 'Ivailov', '0878262634','petkanivailov@yahoo.com',110101,130102),
(120103, 'Iva', 'Georgieva', '0878374729','ivageorgieva@abv.bg',110103,130103);

INSERT INTO plan(plan_id, customer_id, order_status, plan_date, store_id, staff_id)
VALUES(140101,100102,'active','2016-05-04',110102,120103),
(140102,100105,'unactive','2019-12-20',110103,120101),
(140103,100104,'active','2021-03-02',110101,120102);

INSERT INTO brands(brand_id,brand_name)
values(150101,'Samsung'),
(150102,'Huawei'),
(150103,'Apple'),
(150104,'Xaomi'),
(150105,'Sony');


INSERT INTO categories(category_id, category_name) 
values(160101,'telephone'),
(160102,'router'),
(160103,'Console'),
(160104,'Laptop');

INSERT INTO products(product_id, product_name, brand_id, category_id, model_year, list_price)
values(170101,'P30',150102,160101, '2019-03-26',800),
(170102,'B315',150102,160102, '2016-10-15',75),
(170103,'PS4',150105,160103, '2016-02-05',850),
(170104,'Galaxy Book',150101,160104, '2020-04-20',1200);

INSERT INTO plan_item(item_id, plan_id,  quantity, price, discount)
values(170102,140101,1,75,5),
(170104,140103,1,1200,50),
(170101,140102,1,800,60);

INSERT INTO stocks(product_id,store_id,quantity)
values(170102,110102,0),
(170101,110101,10);
