select
    country_name,
    country_code_2_letter,
    country_code_3_letter,
    country_code_numeric,
    iso_3166_2,
    region,
    sub_region,
    intermediate_region,
    region_code,
    sub_region_code,
    intermediate_region_code,
    substring(iso_3166_2, strpos(iso_3166_2, '-'), length(iso_3166_2)) as extractstring
from
    {{ source("DBT_Connect", "CountryISO3") }}
