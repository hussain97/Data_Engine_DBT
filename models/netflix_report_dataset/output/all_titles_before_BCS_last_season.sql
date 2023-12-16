WITH saul_last_season_date_cte AS (
  SELECT 
  PARSE_DATE('%m/%d/%Y',`Release Date`) AS saul_last_season_date
  FROM {{ ref("netflix_report") }}
  WHERE UPPER(TITLE) LIKE '%BETTER CALL SAUL%'
  ORDER BY saul_last_season_date DESC
  LIMIT 1
)

SELECT Title, `Release Date`, saul_last_season_date FROM {{ ref("netflix_report") }}, saul_last_season_date_cte
WHERE PARSE_DATE('%m/%d/%Y',`Release Date`) <= saul_last_season_date
ORDER BY PARSE_DATE('%m/%d/%Y',`Release Date`) DESC





-- Get all the titles before better call sauls last season