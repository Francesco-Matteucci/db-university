-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS 'Anno di Iscrizione', 
       COUNT(*) AS 'Numero di Iscritti'
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY 'Anno di Iscrizione' ASC;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT teachers.office_address AS 'Indirizzo Ufficio', 
       COUNT(teachers.id) AS 'Numero di Insegnanti'
FROM teachers
GROUP BY teachers.office_address
ORDER BY 'Numero di Insegnanti';

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT exams.date AS 'Data Esame', 
       courses.name AS 'Nome Corso', 
       AVG(exam_student.vote) AS 'Media Voti'
FROM exam_student
JOIN exams ON exam_student.exam_id = exams.id
JOIN courses ON exams.course_id = courses.id
GROUP BY exams.date, courses.name  
ORDER BY `Media Voti` ASC;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT departments.name AS 'Nome Dipartimento', 
       COUNT(degrees.id) AS 'Numero di Corsi di Laurea'
FROM departments
JOIN degrees ON departments.id = degrees.department_id
GROUP BY departments.name
ORDER BY 'Numero di Corsi di Laurea';