SELECT name,
  count(assistance_requests.id) AS total_assistances
  FROM students
  JOIN assistance_requests
  ON student_id = students.id
  GROUP BY name
  ORDER BY name;