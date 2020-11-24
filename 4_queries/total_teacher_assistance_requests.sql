SELECT name,
  count(assistance_requests.id) AS total_assistances
  FROM teachers
  JOIN assistance_requests
  ON teacher_id = teachers.id
  GROUP BY name;