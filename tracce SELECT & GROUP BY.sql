-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `date_of_birth` 
FROM `students` 
WHERE YEAR(`date_of_birth`) LIKE '1990';

--! fix post ticket
SELECT `date_of_birth` FROM `students` WHERE YEAR(`date_of_birth`) = '1990';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `cfu` 
FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `date_of_birth` AS 'Più di 30 anni' 
FROM `students` 
WHERE `date_of_birth` < '1992-%-%';

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `period`, `year` 
FROM `courses` 
WHERE `period` LIKE 'I semestre' AND `YEAR` LIKE '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `hour` AS 'Orario', `date` AS 'Giorno' 
FROM `exams` 
WHERE `hour` > '14:00' AND `date` = '2020/06/20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name` AS 'Corsi Laurea Magistrale'
FROM `degrees` 
WHERE `name` LIKE '%Laurea Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `phone`, `name`, `surname` 
FROM `teachers`
WHERE `phone` IS NULL;



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio


-- 3. Calcolare la media dei voti di ogni appello d'esame


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento