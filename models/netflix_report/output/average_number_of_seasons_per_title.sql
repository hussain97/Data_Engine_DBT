WITH titles_multiple_seasons_cte AS (
  SELECT 
  LEFT(Title, STRPOS(TITLE, ':')) AS full_title_name,
  COUNT(TITLE) AS number_of_seasons
  FROM {{ ref("netflix_report") }}
  WHERE UPPER(TITLE) LIKE '%:%'
  GROUP BY full_title_name
),

titles_one_season_cte AS (
  SELECT 
  TITLE AS full_title_name,
  COUNT(TITLE) AS number_of_seasons
  FROM {{ ref("netflix_report") }}
  WHERE UPPER(TITLE) not LIKE '%:%'
  GROUP BY full_title_name
),

grouping_ctes AS (
  SELECT full_title_name, number_of_seasons FROM titles_multiple_seasons_cte
  UNION ALL
  SELECT full_title_name, number_of_seasons FROM titles_one_season_cte
)

SELECT AVG(number_of_seasons) AS AVERAGE_NO_SEASONS FROM grouping_ctes

-- Obtain the average number of seasons out of all titles