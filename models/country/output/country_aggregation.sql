select distinct region, count(*) as region_count
from {{ ref("stg_country_transformed") }}
group by region
