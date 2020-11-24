SELECT teachers.name AS teacher,
  cohorts.name AS cohort,
  count(teacher_id)
FROM assistance_requests
  JOIN teacherS ON teachers.id = teacher_id
  JOIN students on students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name,
  cohorts.name
ORDER BY teacher;