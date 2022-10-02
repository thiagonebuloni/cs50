-- list the names of people that starred a movie released in 2004, sorted by birthday.
-- unique results per name

SELECT DISTINCT people.name FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id WHERE movies.year = 2004 ORDER BY people.birth ASC;