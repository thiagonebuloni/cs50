-- list every title from movies that were released in 2018 and beyond, sorted by alphabetically

SELECT title FROM movies WHERE year >= 2018 ORDER BY title;
