select distinct
year,
country_id,
countryname,
country_abbreviation,
bronzeMedal_Count,
goldMedal_Count,
silverMedal_Count,
total_Medals,
case when bronzeMedal_Count is null then 0
     else bronzeMedal_Count
     end as bronzeMedalCount,
case when goldMedal_Count is null then 0
     else goldMedal_Count
     end as goldMedalCount,
case when silverMedal_Count is null then 0
     else silverMedal_Count
     end as silverMedalCount,
case when total_Medals is null then 0
     else total_Medals
     end as totalmedals
from {{ ref ('medal_by_countryid_flatten') }} 
