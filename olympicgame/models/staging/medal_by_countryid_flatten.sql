select distinct
 r.year,
 r.countryid as country_id,
 r.countryname,
 f.value:abbreviation::string as country_abbreviation,
 f.value:medalStandings:bronzeMedalCount::number as bronzeMedal_Count,
 f.value:medalStandings:goldMedalCount::number as goldMedal_Count,
 f.value:medalStandings:silverMedalCount::number as silverMedal_Count,
 f.value:medalStandings:totalMedals::number as total_Medals
from {{ source ('raw', 'medal_by_countryid') }} r,
lateral flatten(input =>r.leaders,path => 'total') f
