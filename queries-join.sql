-- 1
SELECT students.name AS 'Nome Studente', 
       students.surname AS 'Cognome Studente', 
       students.registration_number AS 'Matricola',
       degrees.name AS 'Corso di Laurea'
FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT degrees.name AS 'Corso di Laurea', 
       degrees.level AS 'Livello', 
       departments.name AS 'Dipartimento'
FROM degrees
JOIN departments ON degrees.department_id = departments.id
WHERE degrees.level LIKE '%Magistrale%'
AND departments.name LIKE '%Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.name AS 'Nome Corso', 
       teachers.name AS 'Nome Insegnante', 
       teachers.surname AS 'Cognome Insegnante'
FROM courses
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id
WHERE teachers.id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name AS 'Nome Studente', 
       students.surname AS 'Cognome Studente', 
       degrees.name AS 'Corso di Laurea', 
       departments.name AS 'Dipartimento'
FROM students
JOIN degrees ON students.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname ASC, students.name ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS 'Corso di Laurea', 
       courses.name AS 'Nome Corso', 
       teachers.name AS 'Nome Insegnante', 
       teachers.surname AS 'Cognome Insegnante'
FROM degrees
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT teachers.name AS 'Nome Insegnante', 
       teachers.surname AS 'Cognome Insegnante', 
       departments.name AS 'Dipartimento'
FROM teachers
JOIN course_teacher ON teachers.id = course_teacher.teacher_id
JOIN courses ON course_teacher.course_id = courses.id
JOIN degrees ON courses.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18

-- senza filtro
SELECT students.name AS 'Nome Studente', 
       students.surname AS 'Cognome Studente', 
       courses.name AS 'Nome Corso', 
       COUNT(exam_student.exam_id) AS 'Numero Tentativi', 
       MAX(exam_student.vote) AS 'Voto Massimo'
FROM students
JOIN exam_student ON students.id = exam_student.student_id
JOIN exams ON exam_student.exam_id = exams.id
JOIN courses ON exams.course_id = courses.id
GROUP BY students.id, courses.id;

-- con filtro
SELECT students.name AS 'Nome Studente', 
       students.surname AS 'Cognome Studente', 
       courses.name AS 'Nome Corso', 
       COUNT(exam_student.exam_id) AS 'Numero Tentativi', 
       MAX(exam_student.vote) AS 'Voto Massimo'
FROM students
JOIN exam_student ON students.id = exam_student.student_id
JOIN exams ON exam_student.exam_id = exams.id
JOIN courses ON exams.course_id = courses.id
WHERE exam_student.vote >= 18
GROUP BY students.id, courses.id;
