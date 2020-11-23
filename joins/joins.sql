-- SELECT students.name as student_name,
--   email,
--   cohorts.name as cohort_name
-- FROM students
--   JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name as student_name,
--   email,
--   cohorts.name as cohort_name
-- FROM students
--   INNER JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name as student_name,
--   email,
--   cohorts.name as cohort_name
-- FROM students
--   LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students 
--   RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;


SELECT students.name AS student_name,
  students.start_date AS start_date,
  cohorts.name AS cohort_name,
  cohorts.start_date AS cohort_start_date
FROM students
  JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;