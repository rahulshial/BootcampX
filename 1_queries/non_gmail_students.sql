SELECT name,
  email,
  phone
FROM students
WHERE email NOT LIKE '%@gmail%'
  AND phone IS NULL;