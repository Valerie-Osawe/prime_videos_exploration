--Data Exploration
-- Basic exploration of title table
SELECT TOP(20) * 
FROM dbo.title;
--Basic exploration for credit table
SELECT TOP(20)*
FROM dbo.credit;
---------------------------------------------------------------------------------
--What is the most popular genre

SELECT genres, COUNT(genres) AS count_genre
FROM dbo.title
GROUP BY genres
ORDER BY count_genre DESC;
---------------------------------------------------------------------------------
-- What is the longest movie and show

SELECT type, MAX(runtime) AS longest_runtime
FROM dbo.title
GROUP BY type;
---------------------------------------------------------------------------------
--What year had the nost released movie and show
--It can be seen that the genre and production countries in the title table are splitted into mutiple rows so the query written should be grouped by id.

SELECT TOP(20) type, release_year, COUNT(release_year) AS year_count
FROM dbo.title
GROUP BY id, type, release_year
ORDER BY year_count DESC;
---------------------------------------------------------------------------------
-- Which actor/director has the highest popularity on tmdb

SELECT TOP(20) t.tmdb_popularity, c.name, c.role
FROM dbo.title t
JOIN dbo.credit c
ON t.id = c.title_id
GROUP BY t.tmdb_popularity, c.name, c.role
ORDER BY t.tmdb_popularity DESC;
---------------------------------------------------------------------------------
--Which countries where the highest number of movies produced

SELECT TOP(20) production_countries, COUNT(production_countries) AS count_countries
FROM dbo.title
GROUP BY production_countries
ORDER BY count_countries DESC;
---------------------------------------------------------------------------------
--Which country does the actors or directors with the highest involvement in a movie come from
--It can be seen that the genre and production countries in the title table are splitted into mutiple rows so queries written should be grouped by id.

SELECT TOP(20) t.production_countries, c.name, COUNT(c.name) AS num_of_invovlement, c.role
FROM dbo.title t
JOIN dbo.credit c
ON t.id = c.title_id
GROUP BY t.id, t.production_countries, c.name, c.role
ORDER BY num_of_invovlement DESC;