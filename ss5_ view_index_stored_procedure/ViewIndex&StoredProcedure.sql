CREATE DATABASE ss5;
use ss5;

CREATE TABLE product(
id INT AUTO_INCREMENT PRIMARY KEY,
product_code VARCHAR(50),
product_name VARCHAR(50),
product_price INT,
product_amount INT,
product_description VARCHAR(50),
product_status VARCHAR(50)
);
INSERT INTO product
VALUE
(1, 'IP-6', 'iphone 6', 500, 10, 'From USA', '99%'),
(2, 'IP-7', 'iphone 7', 700, 10, 'From USA', '100%'),
(3, 'IP-8', 'iphone 8', 1500, 5, 'From UK', '99%'),
(4, 'IP-X', 'i phone X', 1900, 4, 'From Korea', '100%'),
(5, 'IP-XS', 'i phone XS', 2000, 9, 'From Taiwan', '95%');

EXPLAIN SELECT * FROM products WHERE product_code = 'IP-XS';

CREATE INDEX id_products_code ON products(product_code);

EXPLAIN SELECT * FROM products WHERE product_code = 'IP-XS';

CREATE INDEX composite_id_products ON products(product_decription, product_status);

EXPLAIN SELECT * FROM products WHERE product_decription = 'From USA' AND product_status = '100%';