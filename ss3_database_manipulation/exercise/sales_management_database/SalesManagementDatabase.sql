use quan_ly_ban_hang;

INSERT INTO customer(c_name, c_age)
VALUE
('Minh Quan',10 ),
('Ngoc Oanh',20 ),
('Hong Ha',50);

INSERT INTO `order`(c_id, o_date,o_total_prime)
VALUE
(1,'2006-03-21',Null),
(2,'2006-03-23',Null),
(1,'2006-03-16',NULL);

INSERT INTO product(p_name, p_prime)
VALUE
('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

INSERT INTO order_detail(o_id, p_id,od_qty)
VALUE
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- hien thi
SELECT `order`.o_id, `order`.o_date, product.p_prime  FROM order_detail
JOIN `order` ON `order`.o_id = order_detail.o_id
JOIN product ON product.p_id = order_detail.p_id;

SELECT customer.*, product.* FROM customer
JOIN `order` on customer.c_id= `order`.c_id
JOIN order_detail on  `order`.o_id=order_detail.o_id
JOIN product on order_detail.p_id = product.p_id;

SELECT * FROM customer c WHERE c.c_id NOT IN (SELECT c_id FROM `order`);

SELECT `order`.o_id, `order`.o_date, sum(order_detail.od_qty*product.p_prime ) AS tong_tien FROM order_detail
JOIN `order` on order_detail.o_id = `order`.o_id
JOIN product ON product.p_id = order_detail.p_id
GROUP BY o_id


