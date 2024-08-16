select {{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id'])}} as country_key,
 year,
 country_id,
 bronzeMedalCount,
 goldMedalCount,
 silverMedalCount,
 totalMedals
from {{ ref('medal_by_countryid') }} as medal_by_countryid

