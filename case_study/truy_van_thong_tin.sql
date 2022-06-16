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
GROUP BY khach_hang.ma_khach_hang ORDER BY so_lan_dat_phong

-- cau5 
 