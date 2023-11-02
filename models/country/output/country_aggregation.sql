select distinct region, count(*) as region_count
from {{ source("DBT_Connect", "CountryISO3") }}
group by region
