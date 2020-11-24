SELECT students.name as student_name,
  AVG(assignment_submissions.duration) AS average_assignment_duration,
  AVG(assignments.duration) AS average_estimated_duration
FROM students
  JOIN assignment_submissions ON student_id = students.id
  JOIN assignments ON assignments.ID = assignment_id
  WHERE students.end_date IS NULL
GROUP BY student_name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration;