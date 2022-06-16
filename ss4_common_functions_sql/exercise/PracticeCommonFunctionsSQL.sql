use quan_ly_sinh_vien;

SELECT 
    *, MAX(credit)
FROM
    `subject`;

SELECT 
    *, MAX(mark)
FROM
    mark
        JOIN
    `subject` ON `subject`.sub_id = mark.sub_id;

SELECT *, AVG(mark.mark)
FROM student 
JOIN mark ON student.student_id = mark.student_id
GROUP BY student.student_id
ORDER BY AVG(mark.mark) DESC;