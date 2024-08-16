select 
{{dbt_utils.generate_surrogate_key(['results.competition_description','results.event_name'])}} as result_key,
* 
from {{ref('results')}} as results