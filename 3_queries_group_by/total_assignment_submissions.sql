-- EXPLAIN (SELECT cohorts.name AS cohort,
--   count(assignment_submissions.id) AS total_submissions
-- FROM cohorts
--   JOIN students ON cohorts.id = students.cohort_id
--   JOIN assignment_submissions ON students.id = assignment_submissions.student_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC);
--
EXPLAIN (SELECT cohorts.name as cohort,
  count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC);