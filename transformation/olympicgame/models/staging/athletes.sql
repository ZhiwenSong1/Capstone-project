select distinct
id,
name,
sport,
country as country_abbreviation
from {{source('raw','athletes')}}