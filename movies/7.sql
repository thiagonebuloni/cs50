-- list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, sort them in alphabetically by title

SELECT movies.title, ratings.rating FROM movies JOIN ratings on movies.id = ratings.movie_id WHERE movies.year = 2010 AND ratings.rating IS NOT NULL ORDER BY ratings.rating DESC, movies.title ASC;
