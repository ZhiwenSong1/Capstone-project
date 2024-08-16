select 
{{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id'])}} as country_key,
--{{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id'])}} as country_key,
medal_by_countryid.country_id as country_id, 
medal_by_countryid.countryname
country_abbreviation 
from {{ref('medal_by_countryid')}} 
join {{ref('countryid')}}  on medal_by_countryid.country_id = countryid.country_id
