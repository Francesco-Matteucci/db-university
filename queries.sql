
--1
SELECT * FROM students
WHERE YEAR(date_of_birth) = 1990;

--2
SELECT * FROM courses
WHERE cfu > 10;

--3
SELECT * FROM students
WHERE (YEAR(CURDATE()) - YEAR(date_of_birth)) > 30;

--4
SELECT * FROM courses
WHERE year = 1
AND `period` = "I semestre";

--5
SELECT * FROM `exams`
WHERE `date` = "2020-06-20"
AND `hour` > "14%";

--6
SELECT * FROM degrees
WHERE `level` = 'magistrale';

--7
SELECT COUNT(*)
FROM departments;

--8
SELECT COUNT(*) FROM `teachers`
WHERE phone IS NULL;

--9
INSERT `students` (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (4, "Francesco", "Matteucci", "1987-12-31", "MTTFNC87T31I921W", "2024-10-16", "620856", "francescomatteucci31@gmail.com" );

--10
UPDATE `teachers`
SET `office_number` = 126
WHERE `name` = "Pietro"
AND `surname` = "Rizzo";

--11
DELETE FROM students
WHERE `id` = 5001;