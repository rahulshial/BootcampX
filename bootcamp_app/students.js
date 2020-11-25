const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const numOfRows = process.argv[3];

pool.query(`
SELECT s.id, s.name, cohorts.name as cohort
FROM students s
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${cohortName}%'
LIMIT ${numOfRows};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));