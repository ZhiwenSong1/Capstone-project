select 
{{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id'])}} as country_key,
{{dbt_utils.generate_surrogate_key(['athlete_id'])}} as athlete_key,
 year,
 medal_by_countryid.country_id,
 athlete_id,
 bronzeMedalCount,
 goldMedalCount,
 silverMedalCount,
 totalMedals
from {{ ref('medal_by_countryid') }} as medal_by_countryid
join {{ref('medal_by_athletes')}} as medal_by_athletes
on medal_by_athletes.country_id = medal_by_countryid.country_id

