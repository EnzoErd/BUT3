MATCH(n) detach delete n


LOAD CSV WITH HEADERS FROM "file:///Movie.csv" AS movie
WITH movie WHERE movie.boxOffice IS NOT NULL AND movie.class IS NOT NULL
WITH toInteger(movie.idMovie) AS idMovie,
movie.movieName AS movieName,
movie.class AS class,
toInteger(movie.year) AS year,
movie.director AS director
MERGE (m:Movie{idMovie : idMovie,title : movieName,class:class,year:year})
MERGE (d:Director{director:director})
MERGE (d)-[:Dirige]->(m)

match(n) return n
