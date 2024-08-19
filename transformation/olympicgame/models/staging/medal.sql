select
 f2.value:athlete:displayName::string as athlete_name,
 f2.value:athlete:id::number as athlete_id,
 f2.value:competitionType::string as competitionType,
 f2.value:description::string as competition_description,
 f2.value:discipline::string as event_name,
 f2.value:medal::string as medal,
 f2.value:result::string as result,
 r.year,
 r.countryid,
 r.countryname,
 f.value:abbreviation::string as country_abbreviation
from {{source('raw','medal_by_countryid')}} r,
lateral flatten(input =>r.leaders,path => 'total') f,
lateral flatten(input =>r.medals) f1,
lateral flatten(input =>f1.value) f2
