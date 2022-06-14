CREATE DATABASE quan_ly_kho;
USE quan_ly_kho;
CREATE TABLE nha_cc (
    ma_ncc VARCHAR(20) PRIMARY KEY,
    ten_ncc VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(100) NOT NULL
);

CREATE TABLE sdt_ncc(
	sdt VARCHAR(20),
    ma_ncc VARCHAR(20),
    CONSTRAINT fk_ma_sdt_ncc FOREIGN KEY (ma_ncc) REFERENCES nha_cc (ma_ncc)
);

CREATE TABLE vat_tu(
	ma_vat_tu VARCHAR(20) PRIMARY KEY,
    ten_vat_tu VARCHAR(50) NOT NULL
);

CREATE TABLE don_dat_hang(
	so_dh INT AUTO_INCREMENT PRIMARY KEY,
    ngay_dh DATE NOT NULL,
    ma_ncc VARCHAR(50),
	CONSTRAINT fk_ma_ncc FOREIGN KEY (ma_ncc) REFERENCES nha_cc (ma_ncc)
);

CREATE TABLE chi_tiet_don_dh(
    so_dh INT ,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY(so_dh, ma_vat_tu),
    CONSTRAINT fk_don_dh FOREIGN KEY (so_dh) REFERENCES don_dat_hang(so_dh),
    CONSTRAINT fk_don_vt FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_xuat(
	so_px INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE
);

CREATE TABLE chi_tiet_px(
	dg_xuat INT,
    sl_xuat INT,
    so_px INT,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY (so_px, ma_vat_tu),
    CONSTRAINT fk_so_px FOREIGN KEY (so_px) REFERENCES phieu_xuat (so_px),
    CONSTRAINT fk_ma_vat_tu_px FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap(
	so_pn INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_pn(
	dg_nhap INT,
    sl_nhap INT,
    so_pn INT,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY (so_pn, ma_vat_tu),
    CONSTRAINT fk_so_pn FOREIGN KEY (so_pn) REFERENCES phieu_nhap (so_pn),
    CONSTRAINT fk_ma_vat_tu_pn FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);