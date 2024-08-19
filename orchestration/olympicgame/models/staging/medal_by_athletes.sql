SELECT distinct
 athlete_name
, athlete_id
, countryid as country_id
, competitiontype
, medal
, result
--competition_description, event_name use to join with results table
, max(competition_description) OVER (PARTITION BY countryid,competitiontype, medal, result order by countryid, competitiontype, medal, result) as competition_description
, max(event_name) OVER (PARTITION BY countryid,competitiontype, medal, result order by countryid, competitiontype, medal, result) as event_name
from {{ref('medal')}}
where athlete_id is not null
ORDER BY countryid, competitiontype, medal, result
