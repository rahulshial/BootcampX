SELECT day, count(chapter)
FROM assignments
GROUP BY day
ORDER BY day;