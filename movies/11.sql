-- list the titles of 5 movies with better rating (sorted) that Chadwick Boseman starred, starting by higher ratings

SELECT movies.title FROM movies JOIN ratings ON ratings.movie_id = movies.id JOIN stars ON stars.movie_id = movies.id JOIN people ON people.id = stars.person_id WHERE people.name = "Chadwick Boseman" ORDER BY ratings.rating DESC LIMIT 5;