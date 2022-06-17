use task1;
-- task 2

SELECT *
FROM nhan_vien
WHERE ho_ten LIKE 'H%'  OR  ho_ten LIKE 'T%' OR  ho_ten LIKE 'K%' AND char_length(ho_ten)<=15;

-- task 3 
SELECT *
FROM khach_hang 
WHERE (dia_chi LIKE 'Đà Nẵng' OR dia_chi LIKE 'Quảng Trị') and ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50);

-- task 4 
SELECT * , COUNT(khach_hang.ma_khach_hang) as so_lan_dat_phong
FROM khach_hang
JOIN hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
WHERE loai_khach.ten_loai_khach = 'Diamond'
GROUP BY khach_hang.ma_khach_hang ORDER BY so_lan_dat_phong;

-- task 5 
 SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ma_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, sum(dich_vu.chi_phi_thue+(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia)) AS tong_tien
 FROM khach_hang
  LEFT JOIN loai_khach  on loai_khach.ma_loai_khach	 = khach_hang.ma_loai_khach
 LEFT JOIN hop_dong on hop_dong.ma_khach_hang= khach_hang.ma_khach_hang
  LEFT JOIN dich_vu on dich_vu.ma_dich_vu= hop_dong.ma_dich_vu
  LEFT JOIN hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong= hop_dong.ma_hop_dong  
 LEFT JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY khach_hang.ma_khach_hang;

-- task 6
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
FROM hop_dong
INNER JOIN dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
INNER JOIN loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN 
(SELECT hop_dong.ma_dich_vu 
FROM hop_dong 
WHERE year(hop_dong.ngay_lam_hop_dong) = 2021 AND quarter(hop_dong.ngay_lam_hop_dong) =1 )
GROUP BY dich_vu.ma_dich_vu;

-- task7 
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu,hop_dong.ngay_lam_hop_dong
FROM dich_vu
INNER JOIN loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
INNER JOIN hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE (dich_vu.ma_dich_vu in(
SELECT hop_dong.ma_dich_vu
FROM hop_dong
WHERE year(hop_dong.ngay_lam_hop_dong)=2020 ))
GROUP BY dich_vu.ma_dich_vu
HAVING(dich_vu.ma_dich_vu NOT in(
SELECT hop_dong.ma_dich_vu
FROM hop_dong
WHERE year(hop_dong.ngay_lam_hop_dong)=2021 ));

-- task 8
SELECT DISTINCT khach_hang.ho_ten 
FROM khach_hang;

SELECT khach_hang.ho_ten 
FROM khach_hang
GROUP BY ho_ten;

SELECT ho_ten FROM khach_hang
UNION
SELECT ho_ten FROM khach_hang;

-- task 9
SELECT  month(ngay_lam_hop_dong) , COUNT(ma_khach_hang) FROM  hop_dong
WHERE year(ngay_lam_hop_dong) = 2021
GROUP BY ma_khach_hang
ORDER BY month(ngay_lam_hop_dong);

-- task10
