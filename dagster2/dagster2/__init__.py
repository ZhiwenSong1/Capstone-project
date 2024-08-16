##import from library
from dagster import Definitions ##, load_assets_from_modules
from dagster2.assets.airbyte.airbyte import airbyte_assets
from dagster2.assets.dbt.dbt import dbt_warehouse, dbt_warehouse_resource
##from . import assets

##all_assets = load_assets_from_modules([assets])

defs = Definitions(
    assets=[airbyte_assets, dbt_warehouse],
    resources={"dbt_warehouse_resource": dbt_warehouse_resource}
)


