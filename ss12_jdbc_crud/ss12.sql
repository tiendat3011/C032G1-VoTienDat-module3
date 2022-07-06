CREATE DATABASE demo;
USE demo;

create table users (
 id  int PRIMARY KEY AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 status bit(1)
);

insert into users(name, email, country, status ) values('Minh','minh@codegym.vn','Viet Nam',0);
insert into users(name, email, country, status) values('Kante','kante@che.uk','Kenia',0);
