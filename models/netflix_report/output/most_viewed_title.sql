SELECT 
Title,
MAX(`Hours Viewed`) AS hours_viewed_aggregration
FROM {{ ref("netflix_report") }}
GROUP BY Title
ORDER BY hours_viewed_aggregration DESC
limit 1

-- Title with the most hours viewed