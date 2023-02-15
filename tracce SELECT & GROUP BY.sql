-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `date_of_birth` 
FROM `students` 
WHERE `date_of_birth` LIKE '1990';

--! fix post ticket
SELECT `date_of_birth` 
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `cfu` 
FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `date_of_birth` AS 'Più di 30 anni' 
FROM `students` 
WHERE `date_of_birth` < '1992-%-%';

--! fix
SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE (YEAR(CURDATE()) - YEAR(`date_of_birth`)) >=30;


--! Or
SELECT `name`, `surname`,`date_of_birth` 
FROM `students` 
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

--! or
SELECT `name`,`surname`,`date_of_birth` 
FROM `students` 
WHERE `date_of_birth` < DATE_SUB(CURDATE(), INTERVAL 30 YEAR);


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `period`, `year` 
FROM `courses` 
WHERE `period` LIKE 'I semestre' 
AND `YEAR` LIKE '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `hour` AS 'Orario', `date` AS 'Giorno' 
FROM `exams` 
WHERE `hour` > '14:00' 
AND `date` = '2020/06/20';

--! fix
SELECT * 
FROM `exams` 
WHERE `date` = '2020-06-20' 
AND HOUR(`hour`) >= 14;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name` AS 'Corsi Laurea Magistrale'
FROM `degrees` 
WHERE `name` LIKE '%Laurea Magistrale%';

--! fix
SELECT `name`, `level`
FROM `degrees`
WHERE `level`=`magistrale`

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT `phone`, `name`, `surname` 
FROM `teachers`
WHERE `phone` IS NULL;

--! fix
SELECT COUNT(*)  
FROM `teachers`
WHERE `phone` IS NULL;



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `Iscritti`, YEAR(`enrolment_date`) AS `Anno di iscrizione`
FROM `students`
GROUP BY(YEAR(`enrolment_date`));

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(*)
FROM `teachers`
GROUP BY (`office_address`);

--! alternativa post lezione (l'uso di HAVING)
SELECT `office_address`, COUNT(*) AS `teachers_num`
FROM `teachers`
GROUP BY (`office_address`)
HAVING `teachers_num` > 1;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, ROUND(AVG(`vote`)) AS `Media voto`
FROM `exam_student`
GROUP BY(`exam_id`);

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS `num corsi`, `department_id`
FROM `degrees`
GROUP BY(`department_id`);

--! alternative with JOIN
SELECT COUNT(*) AS `num corsi`, `degrees`.`department_id`, `departments`. `id`, `departments` . `name`
FROM `degrees`
INNER JOIN `departments`
ON `departments`. `id` = `degrees`. `department_id`
GROUP BY(`department_id`);