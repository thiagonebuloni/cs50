-- list the titles and release year of all Harry Potter movies, sorted chronologically

SELECT title, year FROM movies WHERE title LIKE 'Harry Potter%' ORDER BY year ASC;
