CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(50),
    c_age INT NOT NULL
);

CREATE TABLE `order` (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_total_prime INT,
    CONSTRAINT fk_c_id FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(50),
    p_prime INT
);

CREATE TABLE order_detal (
    o_id INT,
    p_id INT,
    od_qty INT,
    PRIMARY KEY (o_id , p_id),
    CONSTRAINT fk_o_id FOREIGN KEY (o_id) REFERENCES `order` (o_id),
    CONSTRAINT fk_p_id FOREIGN KEY (p_id) REFERENCES product (p_id)
);