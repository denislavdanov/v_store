DROP DATABASE IF EXISTS v_store;
CREATE DATABASE v_store;
USE v_store ;
CREATE TABLE customer(
id INT AUTO_INCREMENT PRIMARY KEY,
egn VARCHAR(10) NOT NULL UNIQUE,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone INT(10) NOT NULL,
email VARCHAR(30) NOT NULL,
street VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
zip_code VARCHAR(30) NOT NULL
);
CREATE TABLE store(
store_id INT AUTO_INCREMENT PRIMARY KEY,
store_name VARCHAR(30) NOT NULL,
phone INT(10) NOT NULL,
email VARCHAR(30) NOT NULL,
street VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
website VARCHAR(30) NOT NULL

);
CREATE TABLE staff(
staff_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone INT(10) NOT NULL,
email VARCHAR(30) NOT NULL,
store_id INT NOT NULL,
manager_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE plan(
plan_id INT(10) AUTO_INCREMENT PRIMARY KEY,
customer_id INT(8) NOT NULL,
order_status VARCHAR(30) NOT NULL,
plan_date DATE NOT NULL,
store_id INT NOT NULL,
staff_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customer(id),
CONSTRAINT FOREIGN KEY (store_id) REFERENCES store(store_id),
CONSTRAINT FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
CREATE TABLE brands(
brand_id INT AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(30) NOT NULL
);
CREATE TABLE categories(
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(30) NOT NULL
);
CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(30) NOT NULL,
brand_id INT NOT NULL,
category_id INT NOT NULL,
model_year DATE NOT NULL,
list_price INT NOT NULL,
CONSTRAINT FOREIGN KEY (category_id) REFERENCES categories (category_id),
CONSTRAINT FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE plan_item(
item_id INT NOT NULL,
plan_id INT(10) NOT NULL UNIQUE REFERENCES plan (plan_id),
quantity INT NOT NULL,
price INT NOT NULL,
discount INT NOT NULL,
CONSTRAINT FOREIGN KEY (item_id) REFERENCES products(product_id),
FOREIGN KEY(plan_id) REFERENCES plan(plan_id)
);

CREATE TABLE stocks(
product_id INT NOT NULL UNIQUE KEY,
store_id INT NOT NULL UNIQUE KEY,
quantity INT NOT NULL,
CONSTRAINT FOREIGN KEY (product_id) REFERENCES products (product_id),
CONSTRAINT FOREIGN KEY (store_id) REFERENCES store (store_id)

);


