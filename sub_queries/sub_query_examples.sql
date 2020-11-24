-- SELECT (
--     SELECT count(assignments)
--     FROM assignments
--   ) - count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
--   JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';
SELECT avg(total_students) as average_students
FROM (
    SELECT count(students) as total_students,
      cohorts.name as cohort_name
    FROM students
      JOIN cohorts on cohorts.id = cohort_id
    GROUP BY cohorts.name
  ) as totals_table;
-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT x.name,
  x.continent
FROM world AS x
WHERE x.population / 3 > ALL (
    SELECT y.population
    FROM world AS y
    WHERE x.continent = y.continent
      AND x.name != y.name
  );
-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name,
  continent,
  population
FROM world x
WHERE 25000000 >= ALL (
    SELECT population
    FROM world y
    WHERE x.continent = y.continent
      AND population > 0
  );
-- list each continent and the name of the country tat comes first alplabetically
select continent,
  name
from world x
where name = (
    select name
    from world y
    where x.continent = y.continent
    order by name asc
    limit 1
  );
-- Find the largest country by area in each continent, show continent, name and area
SELECT continent,
  name,
  area
FROM world x
WHERE area >= ALL (
    SELECT area
    FROM world y
    WHERE y.continent = x.continent
      AND area > 0
  )