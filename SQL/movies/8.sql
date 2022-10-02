-- list the names of all the people who starred in Toy Story, generating only one name column for each person

SELECT people.name FROM people JOIN stars ON people.id = stars.person_id WHERE stars.movie_id = (SELECT movies.id FROM movies JOIN stars ON stars.movie_id = movies.id WHERE movies.title = "Toy Story");
