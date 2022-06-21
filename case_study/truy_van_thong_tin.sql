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

SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ma_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, sum(dich_vu.chi_phi_thue+ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) AS tong_tien
FROM khach_hang
LEFT JOIN loai_khach  on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
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

select hd.ma_hop_dong,
 hd.ngay_lam_hop_dong, 
 hd.ngay_ket_thuc, 
 hd.tien_dat_coc, 
 sum(ifnull(hdct.so_luong,0)) as 'Số lần sử dụng'
from hop_dong hd
LEFT join hop_dong_chi_tiet hdct on hdct.ma_hop_dong= hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
ORDER BY ma_hop_dong;

-- task11

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, lk.ten_loai_khach, kh.ho_ten
from hop_dong_chi_tiet hdct 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach= lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" OR kh.dia_chi = "Quảng Ngãi")
;

-- task 12
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as 'Số lượng dịch vụ đi kèm', hd.tien_dat_coc,hd.ngay_lam_hop_dong
from hop_dong_chi_tiet hdct 
right join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where (dv.ma_dich_vu in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)=2020 and quarter(ngay_lam_hop_dong)=4))
and (dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong) =2021 and quarter(hd.ngay_lam_hop_dong)<=2))
group by hd.ma_hop_dong ;

-- task 13

SELECT 
dich_vu_di_kem.ma_dich_vu_di_kem,
dich_vu_di_kem.ten_dich_vu_di_kem , 
sum(hop_dong_chi_tiet.so_luong) as so_lan_dat_phong
FROM hop_dong_chi_tiet
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
HAVING so_lan_dat_phong = (SELECT sum(so_luong) 
FROM hop_dong_chi_tiet 
GROUP BY ma_dich_vu_di_kem 
ORDER BY sum(so_luong) DESC LIMIT 1); 

-- task 14

SELECT
 hop_dong.ma_hop_dong, 
 loai_dich_vu.ten_loai_dich_vu,
 dich_vu_di_kem.ten_dich_vu_di_kem,
 count(dich_vu_di_kem.ma_dich_vu_di_kem) AS so_lan_su_dung
 FROM hop_dong_chi_tiet 
join hop_dong  on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu_di_kem  on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join dich_vu  on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu  on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
group by dich_vu_di_kem.ten_dich_vu_di_kem
having  count(hop_dong_chi_tiet.ma_dich_vu_di_kem) = 1 ;

-- task 15 
select 
nhan_vien.ma_nhan_vien, 
nhan_vien.ho_ten,
 trinh_do.ten_trinh_do,
 bo_phan.ten_bo_phan, 
 nhan_vien.so_dien_thoai, 
 nhan_vien.dia_chi, 
 count(hop_dong.ma_nhan_vien) as 'so_lan_lap_hd'
from hop_dong 
join nhan_vien  on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
join bo_phan  on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join trinh_do  on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
where (year(hop_dong.ngay_lam_hop_dong) between 2020 and 2021)
group by hop_dong.ma_nhan_vien
having count(hop_dong.ma_nhan_vien) <=3;

-- task16

select ma_nhan_vien from nhan_vien;
delete from nhan_vien 
where nhan_vien.ma_nhan_vien not in 
(select hop_dong.ma_nhan_vien from hop_dong  
where year(ngay_lam_hop_dong) 
between 2019 and 2021);
 
 -- task 17
 
 
 -- task 18
delete from khach_hang where ma_khach_hang in 
(select ma_khach_hang 
from hop_dong 
where year(ngay_lam_hop_dong) <2021 );

-- task 19

update dich_vu_di_kem  set gia = gia*2 
where gia in (select gia 
from (select dich_vu_di_kem.* from hop_dong_chi_tiet  
join dich_vu_di_kem  on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong  on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where hop_dong_chi_tiet.so_luong >10 and year(hop_dong.ngay_lam_hop_dong)=2020) as temp) ;


-- task 20

select 
nhan_vien.ma_nhan_vien, 
nhan_vien.ho_ten,
 nhan_vien.email, 
 nhan_vien.so_dien_thoai, 
 nhan_vien.ngay_sinh, 
 nhan_vien.dia_chi from nhan_vien 
union all
select khach_hang.ma_khach_hang, khach_hang.ho_ten