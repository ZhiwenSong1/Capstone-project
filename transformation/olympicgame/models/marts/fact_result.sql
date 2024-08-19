{{
    config(
        materialized="incremental",
        unique_key=["uni_key"],
        incremental_strategy="delete+insert",
    )
}}

SELECT 
{{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id'])}} as country_key,
{{dbt_utils.generate_surrogate_key(['athlete_id'])}} as athlete_key,
{{dbt_utils.generate_surrogate_key(['medal_by_athletes.competition_description','medal_by_athletes.event_name'])}} as result_key,
 {{dbt_utils.generate_surrogate_key(['medal_by_countryid.country_id','athlete_id','medal_by_athletes.competition_description','medal_by_athletes.event_name'])}} as uni_key,
 athlete_name
, athlete_id
, medal_by_countryid.country_id
, competitiontype
, medal
, result
--competition_description, event_name are used to join with results table
, medal_by_athletes.competition_description
, medal_by_athletes.event_name
, competition_date
from {{ ref('medal_by_countryid') }} as medal_by_countryid
join {{ref('medal_by_athletes')}} as medal_by_athletes
on medal_by_athletes.country_id = medal_by_countryid.country_id
join {{ref('results')}} as results
on results.competition_description = medal_by_athletes.competition_description
and results.event_name = medal_by_athletes.event_name
{% if is_incremental() %}
    where competition_date > (select max(competition_date) from {{ this }} )
{% endif %}


