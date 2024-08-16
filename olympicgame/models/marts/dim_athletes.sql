select {{dbt_utils.generate_surrogate_key(['athletes.id'])}} as athlete_key,
id as athlete_id,
name as athlete_name,
sport,
country
from {{ref('athletes')}}