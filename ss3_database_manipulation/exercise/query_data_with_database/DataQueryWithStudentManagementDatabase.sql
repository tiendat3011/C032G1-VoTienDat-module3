CREATE DATABASE quan_ly_sinh_vien;

USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATE NOT NULL,
    `Status` BIT
);

INSERT INTO  class(class_name,start_date,`Status` )
VALUE
 ( 'A1', '2008-12-20', 1),
 ( 'A2', '2008-12-22', 1),
 ( 'B3', curdate(), 0);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

INSERT INTO student(student_name,address,phone,`status`,class_id)
VALUE
 ('Hung', 'Ha Noi', '0912113113', 1, 1),
 ('Hoa', 'Hai phong',NULL,1, 1),
 ('Manh', 'HCM', '0123123123', 0, 2);

CREATE TABLE `subject` (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT DEFAULT 1
);

INSERT INTO `subject`(sub_id,sub_name,credit, `status`)
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
CREATE TABLE mark (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

SELECT *
FROM student
WHERE student_id LIKE '%h';

SELECT *
FROM class
WHERE month(start_date) = "12";

SELECT *
FROM `subject`
WHERE credit Between 3 and 5;

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
Set class_id = '2'
WHERE student_name = 'Hung';

SELECT student.student_name,`subject`.sub_name,mark FROM mark
JOIN student on student.student_id = mark.student_id
JOIN `subject` on `subject`.sub_id = mark.sub_id
ORDER BY mark DESC , sub_name ASC;