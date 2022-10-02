-- list the names of every people who directed a movie with ratings equal 9.0 or greater

SELECT DISTINCT people.name FROM people JOIN directors ON people.id = directors.person_id JOIN movies ON movies.id = directors.movie_id JOIN ratings ON ratings.movie_id = movies.id WHERE ratings.rating >= 9.0;