CREATE DATABASE task1;
use task1;
CREATE TABLE vi_tri(
ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
ten_vi_tri VARCHAR(50));

CREATE TABLE trinh_do(
ma_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
ten_trinh_do VARCHAR(50));
CREATE TABLE bo_phan(
ma_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
ten_bo_phan VARCHAR(50));
CREATE TABLE nhan_vien(
ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
ho_ten VARCHAR(50) not NULL,
ngay_sinh date not null,
so_cmnd int NOT NULL,
so_dien_thoai int NOT NULL,
email VARCHAR(50) not null,
dia_chi VARCHAR(50) NOT NULL,
customer
);