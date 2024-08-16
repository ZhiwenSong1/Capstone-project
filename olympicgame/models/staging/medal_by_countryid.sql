select distinct
 r.year,
 r.countryid as country_id,
 r.countryname,
 f.value:abbreviation::string as country_abbreviation,
 f.value:medalStandings:bronzeMedalCount as bronzeMedalCount,
 f.value:medalStandings:goldMedalCount as goldMedalCount,
 f.value:medalStandings:silverMedalCount as silverMedalCount,
 f.value:medalStandings:totalMedals as totalMedals
from {{ source ('raw', 'medal_by_countryid') }} r,
lateral flatten(input =>r.leaders,path => 'total') f
