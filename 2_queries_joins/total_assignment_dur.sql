SELECT sum(assignment_submissions.duration) AS total_duration
  FROM assignment_submissions
  JOIN students
  ON student_id = students.id
  AND students.name = 'Ibrahim Schimmel';
