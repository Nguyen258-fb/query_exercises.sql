-- Bước 1: Sử dụng cơ sở dữ liệu
USE quanlysinhvien;

-- 1. Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự ‘h’ (không phân biệt hoa thường)
SELECT *
FROM Student
WHERE StudentName LIKE 'h%' OR StudentName LIKE 'H%';

-- 2. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

-- 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3 đến 5
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

-- 4. Thay đổi mã lớp (ClassID) của sinh viên có tên ‘Hung’ thành 2
-- (Lưu ý: Tắt Safe Update Mode nếu cần thiết bằng lệnh: SET SQL_SAFE_UPDATES = 0;)
UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';

-- 5. Hiển thị các thông tin: StudentName, SubName, Mark. Sắp xếp giảm dần theo Mark, nếu trùng sắp tăng dần theo StudentName
SELECT S.StudentName, Sub.SubName, M.Mark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
JOIN Subject Sub ON M.SubId = Sub.SubId
ORDER BY M.Mark DESC, S.StudentName ASC;
