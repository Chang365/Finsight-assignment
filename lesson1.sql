-- Lesson 2 Using SQL in Mode
SELECT *
FROM tutorial.us_housing_units;
-- Lesson 3 SQL SELECT
-- 특정 columns(year, month, month_name)만 불러오기
SELECT year, month, month_name
FROM tutorial.us_housing_units;
-- use * instead of column names
SELECT *
FROM tutorial.us_housing_units
-- Write a query to select all of the columns in the tutorial.us_housing_units table without using *.
SELECT year,
       month,
       month_name,
       west,
       midwest,
       south,
       northeast
FROM tutorial.us_housing_units

SELECT west AS "West Region"
  FROM tutorial.us_housing_units
  
SELECT west AS West_Region,
       south AS South_Region
  FROM tutorial.us_housing_units
  
SELECT year AS "Year",
       month AS "Month",
       month_name AS "Month Name",
       west AS "West",
       midwest AS "Midwest",
       south AS "South",
       northeast AS "Northeast"
  FROM tutorial.us_housing_units;
-- Lesson 4 SQL Limit
-- Limit 100 박스 체크하면 100개까지만 표시됨
SELECT *
  FROM tutorial.us_housing_units
  limit 100
SELECT *
  FROM tutorial.us_housing_units
  lIMIT 15;
-- lesson 5 SQL WHERE
-- Select, From, Where 순서여야함
SELECT *
  FROM tutorial.us_housing_units
 WHERE month = 1
-- Lesson 6 SQL Comparison Operators
SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 30

SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name != 'January'
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'January'
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'J'
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name < 'o'
 
 -- +-*/
SELECT year,
       month,
       west,
       south,
       west + south AS south_plus_west
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       west + south - 4 * year AS nonsense_column
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       midwest,
       northeast,
       west + south + midwest +northeast AS usa_total
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       midwest,
       northeast
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)
  
SELECT year,
       month,
       west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
  FROM tutorial.us_housing_units
 WHERE year >= 2000
 
 -- Lesson 7 SQL Logical Operators
 --like, in, between, is null, and, or, not
 
SELECT * FROM tutorial.billboard_top_100_year_end
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
 -- Lesson 8 SQL LIKE
 -- LIKE allows you to match on similar values rather than exact ones.
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group_name" LIKE 'Snoop%'
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group_name" ILIKE 'snoop%'
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke'
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ilike '%ludacris%'
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'DJ%'
 
 -- Lesson 9 SQL IN
 -- IN allows you to specify a list of values that you'd like to include in the results.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
 
 -- Lesson 10 SQL BETWEEN
 -- BETWEEN allows you to select only rows that are within a specific range.
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1985 AND 1990
 
 -- Lesson 11 SQL IS NULL
 -- IS NULL allows you to exclude rows with missing data from your results.
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL
 
 -- Lesson 12 SQL AND
 -- AND allows you to select only rows that satisfy two conditions.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012 AND year_rank <= 10
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
   AND year_rank <= 10
   AND "group_name" ILIKE '%feat%'
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND "group" ILIKE '%ludacris%'
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
   AND year IN (1990, 2000, 2010)
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1960 AND 1969
   AND song_name ilike '%love%'

-- Lesson 13 SQL OR
-- OR allows you to select rows that satisfy either of two conditions.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 5 OR artist = 'Gotye'
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND ("group_name" ILIKE '%macklemore%' OR "group_name" ILIKE '%timberlake%')
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%dr. dre%'
   AND (year <= 2000 OR year >= 2010)

-- Lesson 14  SQL NOT
-- NOT -> you can put before any conditional statement to select rows for which that statement is false.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT BETWEEN 2 AND 3

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT > 3

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group_name" NOT ILIKE '%macklemore%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL
   
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name NOT ILIKE '%a%'
    AND year = 2013
-- Lesson 15  SQL ORDER BY
-- ORDER BY clause allows you to reorder your results based on the data in one or more columns. 

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
 ORDER BY song_name DESC
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY year_rank, year DESC
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY 2, 1 DESC
 
/* Here's a comment so long and descriptive that
it could only fit on multiple lines. Fortunately,
it, too, will not affect how this code runs. */
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%t-pain%'
 ORDER BY year_rank DESC