SELECT students.name as student,
  count(student_id) as total_submissions
FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(student_id) < 100;