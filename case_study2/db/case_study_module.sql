use case_study_module3;

INSERT INTO `position`
VALUES 
(1,'Lễ tân'),
(2,'Phục vụ'),
(3,'Chuyên viên'),
(4,'Giám sát'),
(5,'Quản lý'),
(6,'Giám đốc');

INSERT INTO education_degree  VALUE
(1,'Trung cấp'),
(2,'Cao đẳng'),
(3,'Đại học'),
(4,'Sau đại học');

INSERT INTO division VALUE
(1,'sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');

INSERT INTO `user` VALUE
('dat@furama.com','dat123'),
('haohao@furama.com','haohao123'),
('trung@furama.com','trung123'),
('long@furama.com','long123'),
('cuong@furama.com','cuong123'),
('truong@furama.com','truong123'),
('uyen@furama.com','uyen123');

INSERT INTO `role` VALUE
(1,'admin'),
(2,'user');
INSERT INTO user_role VALUE
                     (2,'dat@furama.com'),
                     (1,'haohao@furama.com'),
                     (2,'trung@furama.com'),
                     (2,'long@furama.com'),
                     (1,'cuong@furama.com'),
                     (2,'truong@furama.com'),
                     (1,'uyen@furama.com');

INSERT INTO employee VALUE
(1,'Nguyễn Tiến Đạt', '1999-07-08', '201887802', 10000, '0762709502', 'datdanne@gmail.com', 'Đà Nẵng', 6, 4, 4, 'dat@furama.com', 0),
(2,'Nguyễn Hoàng Hảo',	'1999-08-13', '89871234', 2000,	'0907123431', 'hoanghao9x87@gmail.com', 'Đà Nẵng', 1, 1, 3, 'haohao@furama.com', 0),
(3,' Nguyễn Duy Trung ' ,'1999-11-11', '12390867', 3000, '0912076345', 'trungtretrau@gmail.com', 'Quảng Trị', 2, 1, 3, 'trung@furama.com' ,0),
(4,'Nguyễn Bảo Long', '2003-07-18', '01098712', 4000, '072198076', 'baolonglon@gmail.com',	'Quảng Nam', 2,	1, 3, 'long@furama.com',0),
(5,'Nguyễn Mạnh Cường', '1999-04-02', '123908663', 5000, '0777648604', 'cuong@gmail.com', 'Tam Kỳ', 3, 3, 1, 'cuong@furama.com', 0),
(6,'Trần Xuân Trường',	'1998-10-05', '879044321', 6000, '099186742', 'truongmapday@gmail.com', 'Đà Nẵng', 4 ,3 ,4, 'truong@furama.com', 0),
(7,'Nguyễn Thảo Uyên', '1997-02-03', '46731234', 7000, '065490873', 'uyen@gmail.com' , 'Đà Nẵng', 5, 4, 2, 'uyen@furama.com', 0);
INSERT INTO customer_type VALUE
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');
INSERT INTO customer VALUE
('KH-0001', 1,	'Nguyễn Hoàng Hảo', '1999-07-08', 0,'201887802', '0762709502', 'hoanghao9x87@gmail.com', 'Đà Nẵng', 0),
('KH-0002', 2,	'Nguyễn Thảo Uyên',	'1999-08-13', 1,'89871234',	'0907123431', 'uyen@gmail.com', 'Đà Nẵng', 0),
('KH-0003', 3, 'Nguyễn Tiến Đạt','1999-11-11',   0,'12390867', '0912076345', 'datdanne@gmail.com', 'Quảng Trị', 0),
('KH-0004', 4,	'Nguyễn Duy Trung', '2003-07-18', 1,'201098712', '072198076', 'trungtretrau@gmail.com',	'Quảng Nam', 0),
('KH-0005', 5, 'Dương Trung Kiên', '1999-04-02', 1,'123908663', '0777648604', 'trungne@gmail.com', 'Tam Kỳ', 0),
('KH-0006', 5,	'Trần Xuân Trường',	'1998-10-05', 0,'879044321', '099186742', 'truongmapday@gmail.com', 'Đà Nẵng', 0),
('KH-0007', 5, 'Nguyễn Bảo Long', '1997-02-03', 0, '46731234', '065490873', 'baolonglon@gmail.com' , 'Đà Nẵng', 0);
INSERT INTO facility_type VALUE
(1,'4 sao'),
(2,'3 sao');
INSERT INTO rent_type VALUE
(1,'Ngày'),
(2,'Tháng'),
(3,'Năm'),
(4,'Giờ');
INSERT INTO facility VALUE
('DV-0001', 'Villa', 1000, 8000, 20, 2, 2, 'VIP', 'Không', 50, 3, null, 0),
('DV-0002', 'House', 100, 700, 13, 1, 1, 'NORMAL', 'Không', NULL, null,6 ,0),
('DV-0003', 'Room', 70, 60000, 3, 3, 2, NULL, NULL, NULL, NULL,'mì tôm',0);
INSERT INTO attach_facility VALUE
(1 , 'Karaoke', 10.0, 'Giờ', 'Đang hoạt động'),
(2 , 'Buffet', 20.0,  'Suất', 'Nghỉ'),
(3 , 'Massage', 10.0, 'Lần', 'Đang hoạt động');
INSERT INTO contract VALUE
(1, '2022-06-03', '2022-06-07', 100, 1, 'KH-0003', 'DV-0002', 0),
(2, '2022-06-05', '2022-07-05', 1000, 4, 'KH-0006', 'DV-0001', 0);
INSERT INTO contract_detail VALUE
(1, 1, 1, 3),
(2, 1, 3, 2);