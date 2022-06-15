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
luong DOUBLE,
so_dien_thoai int NOT NULL,
email VARCHAR(50) not null,
dia_chi VARCHAR(50) NOT NULL,
ma_vi_tri INT ,
ma_trinh_do INT,
ma_bo_phan INT,
CONSTRAINT fk_ma_vi_tri FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
CONSTRAINT fk_ma_trinh_do FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
CONSTRAINT fk_ma_bo_phan FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach(
	ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(50)
);

CREATE TABLE khach_hang(
ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
ho_ten VARCHAR(45),
ngay_sinh DATE,
gioi_tinh BIT,
so_cmnd int NOT NULL,
so_dien_thoai int NOT NULL,
email VARCHAR(50) not null,
dia_chi VARCHAR(50) NOT NULL,
ma_loai_khach INT,
CONSTRAINT fk_ma_loai_khach FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue(
	ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50)
);

CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50)
);

CREATE TABLE dich_vu(
	ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(50),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(50),
	mo_ta_tien_nghi_khac VARCHAR(45),
	dien_tich_ho_boi DOUBLE,
    so_tang INT,
	ma_kieu_thue int,
    ma_loai_dich_vu INT,
	CONSTRAINT fk_ma_kieu_thue_ FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
	CONSTRAINT fk_ma_loai_dich_vu FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)  
);

CREATE TABLE loai_dich_vu(
	ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(50),
    gia INT,
    don_vi VARCHAR(20),
    trang_thia
);



