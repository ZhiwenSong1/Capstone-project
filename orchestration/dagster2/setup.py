from setuptools import find_packages, setup

setup(
    name="dagster2",
    packages=find_packages(exclude=["dagster2_tests"]),
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-airbyte",
        "dagster-dbt",
        "dbt-core==1.7.2",
        "dbt-snowflake==1.7.2",
    ],
    extras_require={"dev": ["dagster-webserver", "pytest"]},
)

