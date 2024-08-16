
select 
r.year,
f.value:id::number as event_id,
f.value:name::string as event_name,
f.value:slug::string as event_slug,
f.value:sportId::number as event_sportid,
f.value:sportName::string as event_sportName,
f.value:sportSlug::string as event_sportSlug,
--f1.value:competitions as competitions
f1.value:id::number as competition_id,
f1.value:name::string as competition_name,
f1.value:shortName::string as competition_short_name,
f1.value:slug::string as competition_slug,
f1.value:type::string as competition_type,
--f1.value:competitions as competitions,
f2.value:date::timestamp as competition_date,
f2.value:description::string as competition_description,
f2.value:finalMedalComp::boolean as competition_finalMedalComp,
f2.value:resultType::string as competition_resultType
from {{ source ('raw', 'results') }} r,
lateral flatten(input => r.results) f,
lateral flatten(input =>f.value:events) f1,
lateral flatten(input =>f1.value:competitions) f2