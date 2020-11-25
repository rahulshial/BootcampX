const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];

pool.query(`
SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
JOIN teacherS ON teachers.id = teacher_id
JOIN students on students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = '${cohortName || 'JUL02'}'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;
`)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));