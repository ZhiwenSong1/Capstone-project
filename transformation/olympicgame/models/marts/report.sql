SELECT distinct
 fact_results.athlete_name
, fact_results.athlete_id
, dim_medal_by_countryid.country_id
, dim_medal_by_countryid.countryname
, dim_country.country_abbreviation
, fact_results.competitiontype
, fact_results.medal
, fact_results.result
--competition_description, event_name are used to join with results table
, dim_results.competition_description
, dim_results.event_name
, dim_results.competition_date
, dim_results.competition_name
, bronzeMedalCount
, goldMedalCount
, silverMedalCount
, totalMedals
from {{ref('dim_medal_by_countryid')}} as dim_medal_by_countryid
join {{ref('fact_result')}} as fact_results
on fact_results.country_key = dim_medal_by_countryid.country_key
join {{ref('dim_results')}} as dim_results
on dim_results.result_key= fact_results.result_key
join {{ref('dim_country')}} as dim_country
on dim_country.country_key = fact_results.country_key

