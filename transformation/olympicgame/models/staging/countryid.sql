select 
distinct
f.key::number as country_id,
f.value::string as country_name
from {{ source ('raw', 'countryid') }} r,
lateral flatten(input => r.countryids) f
order by country_id