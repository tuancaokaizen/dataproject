USE Netflix_Project;
----------------------
SELECT *
FROM netflix_titles;
----------------------
SELECT TOP 5 *
FROM netflix_titles;
----------------------
SELECT DISTINCT TOP 5 (show_id) FROM netflix_titles;
----------------------
SELECT DISTINCT TOP 5 (title) FROM netflix_titles
WHERE release_year > 2020;
----------------------
SELECT DISTINCT(title) FROM netflix_titles
WHERE release_year > 2020 AND title ='Blood & Water' OR release_year < 2021 AND title='Kota Factory'AND NOT country= 'India';
----------------------
SELECT TOP 1
min(release_year) AS min_release_year,
max(release_year) AS max_release_year,
count(distinct release_year) AS count_of_release_year,
round(avg(release_year),2) AS avg_of_all_release_years,
sum(release_year) AS avg_of_all_release_years
FROM netflix_titles;
----------------------
SELECT * FROM netflix_titles
WHERE country IN ('India','United States','Austrailia')
ORDER BY country ASC;
----------------------
SELECT * FROM netflix_titles
WHERE release_year BETWEEN 2020 AND 2021;
----------------------
SELECT
n1.show_id AS Show_id,
n2.type AS Show_Type,
n2.title AS Show_Title
FROM netflix_titles n1
JOIN netflix_titles n2 ON n1.show_id = n2.show_id;
----------------------
SELECT * FROM netflix_titles WHERE country='India'
UNION ALL
SELECT * FROM netflix_titles WHERE country='United States';
----------------------
SELECT
sum(CASE WHEN country='India' THEN 1 ELSE 0 END) AS Shows_in_India,
sum(CASE WHEN country='United States' THEN 1 ELSE 0 END) AS Shows_in_United_States,
sum(CASE WHEN country='South Africa' THEN 1 ELSE 0 END) AS Shows_in_South_Africa
FROM netflix_titles;
----------------------
SELECT DISTINCT TOP 5 (a.title) FROM (SELECT * FROM netflix_titles) a;
----------------------
SELECT COALESCE(release_year,0) as first_non_zero_value FROM netflix_titles;
----------------------
SELECT CAST(release_year as float) AS first_non_zero_value FROM netflix_titles;
----------------------
SELECT
title,
release_year,
CASE WHEN release_year = lag(release_year) OVER (ORDER BY release_year ASC) THEN 1 ELSE 0 END AS Back_to_Back
FROM netflix_titles
ORDER BY release_year ASC;