select
f.value:competitionType::string as competitionType,
f.value:date::timestamp as date,
f.value:event:name::string as competition_name,
f.value:competitionTypeId::number as competitionTypeId,
f.value:event:id::number as competition_id,
f.value:olympicsStatus:description::string as olympicsStatus_description,
f.value:olympicsStatus:completed::boolean as olympicsStatus_completed,
f.value:resultType::string as resultType
from {{source('raw','schedule')}} r,
lateral flatten(input=> r.schedule, path => 'Final') f