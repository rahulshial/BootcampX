SELECT day, COUNT(chapter)
FROM assignments
GROUP BY day
HAVING COUNT(chapter) >= 10
ORDER BY day;