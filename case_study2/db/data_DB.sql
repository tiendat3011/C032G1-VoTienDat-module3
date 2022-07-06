CREATE database case_study_module3;
use case_study_module3;

create table `position`(
id int primary key auto_increment,
name varchar(45));
create table education_degree(
id int primary key auto_increment,
name varchar(45));
create table division(
id int primary key auto_increment,
name varchar(45));
  create table `user`
  (user_name varchar(255) primary key ,
  password varchar(255)
  );
  create table `role`(
  id int primary key auto_increment,
name varchar(45)
);
CREATE TABLE user_role (
    role_id INT,
    user_name VARCHAR(255),
    PRIMARY KEY (role_id , user_name),
    FOREIGN KEY (role_id) REFERENCES `role`(id),
    FOREIGN KEY (user_name) REFERENCES `user`(user_name)
);
 create table employee
 (
 id int primary key auto_increment,
 name varchar(45) not null,
 date_of_birth date not null,
 id_card varchar(45) not null,
 salary double not null,
 phone_number varchar(45) not null,
 email varchar(45),
 address varchar(45),
position_id int,
education_degree_id int,
division_id int,
user_name varchar(255),
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id),
foreign key(user_name) references user_role(user_name),
status_delete bit(1)
);
 create table customer_type
 (id int primary key auto_increment,
name varchar(45));
 CREATE TABLE customer (
    id Varchar(45) PRIMARY KEY ,
    customer_type_id INT,
    FOREIGN KEY (customer_type_id)
        REFERENCES customer_type (id),
    name VARCHAR(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender BIT(1),
    id_card VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    status_delete BIT(1)
);
 create table facility_type
  (id int primary key auto_increment,
name varchar(45));
create table rent_type
 (id int primary key auto_increment,
name varchar(45));
create table facility
 (id varchar(45) primary key ,
name varchar(45),
area int,
cost double not null,
max_people int ,
rent_type_id int,
facility_type_id int,
foreign key (rent_type_id) references rent_type(id),
foreign key (facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
status_delete BIT(1)
);
create table contract(
id int primary key auto_increment,
start_date datetime not null,
end_date datetime not null,
deposit double not null,
employee_id int,
customer_id varchar(45),
facility_id varchar(45),
status_delete BIT(1),
foreign key (employee_id) references employee(id),
foreign key (customer_id) references customer(id),
foreign key (facility_id) references facility(id)
);
create table attach_facility
(id int primary key auto_increment,
name varchar(45) not null,
cost double not null,
unit varchar(45)not null,
status varchar(45)
);
create table contract_detail
(
id int primary key auto_increment,
contract_id int,
attach_facility_id int,
foreign key (contract_id) references contract(id),
foreign key (attach_facility_id) references attach_facility(id),
quantity int not null
);