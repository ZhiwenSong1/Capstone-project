# Capstone-project


Using airbyte

1. Start Docker Desktop
2. Navigate to the airbyte directory and execute the bash script to start airbyte
    cd integration/airbyte
   ```
   ./run-ab-platform.sh
   ```
3. Login to airbyte http://localhost:8000 using default username airbyte with password.
4. Create a new source and choose the custom API connector "Olympic Sports API - Overall"
    ![source](images/airbyte/airbyte_source.png)
5. Create a destination for the Snowflake database
    ![destination](images/airbyte/airbyte_destination.png)
6. Create a connection between Olympic Sports API and snowflake database
    ![connection](images/airbyte/airbyte_connection.png)
7. Run the sync job
8. Host airbyte on AWS EC2 instance named "my-airbyte"
    ![EC2_instance](images/airbyte_ec2_image/ec2_aws_instance.png)
9. Connect EC2 instance by SSH. Then install airbyte and start it.
    ![ssh_airbyte](<images/airbyte_ec2_image/airbyte on EC2.png>)
10. Repeat the process 3 to 7 just as running on the local machine but replace the localhost in http://localhost:8000 with EC2 public ip address.
    ![EC2_IP_address](images/airbyte_ec2_image/ec2_aws.png)
    ![airbyte_running_on_EC2](images/airbyte_ec2_image/airbyte_running_in_ecs.png)


Using snowflake

1. Log in to the snowflake account
2. Go to projects -> worksheets -> + worksheet
3. On the top right, select the role ACCOUNTADMIN.
4. On the top left of the worksheet, select OLYMPIC.MARTS
5. Query one of the synced tables in MARTS, e.g. 
    ```
    select * from dim_medal_by_countryid
    ```


Transformation using dbt

1. cd to transformation/olympicgame
2. Execute `dbt run`
    ![dbt_log](<images/dbt_image/dbt run.png>)
3. Execute the command `dbt docs generate` to create the dbt documentations and `dbt docs serve` to create and view the lineage graph
    ![dbt_lineage_graph](images/dbt_image/dbt_lineage_graph.png)
4. Execute the command `dbt build` to run and test dbt models

Orchestration using dagster

part1 running etl process using dagster on local machine
1. cd to orchestration/dagster2
2. Start airbyte by using command 
    ```
    ./run-ab-platform.sh 
    ```
3. Execute `dagster dev` to trigger dagster webserver and click reload all to load definition
    ![dagster_reload_definition](images/dagster_image/dagster_reload_definition.png)
4. Click "Assets" and then "Global Asset Lineage", "Materialize all" to run etl process
    ![assets](images/dagster_image/dagster_run1.png)
    ![materialize](images/dagster_image/dagster_run2.png)
5. Successfully deployed.
    images/dagster_image/dagster_detail1.png
    ![deployment1](images/dagster_image/dagster_detail1.png)
    ![deployment2](images/dagster_image/dagster_detail2.png)
    ![deployment3](images/dagster_image/dagster_detail3.png)

Using Confluent

1. Log ino confluent
2. Create a new Environment and click on `+ Add Cluster`
3. Click into your environment and click on `+ Add Cluster`
4. Create a Topic named as 'olympic1' inside the cluster
5. Create a Python connector and configure the `bootstrap.server`. Replace the `client.properties` values accordingly.
   ```
   # Required connection configs for Kafka producer, consumer, and admin
   bootstrap.servers=your_cluster_bootstrap_server
   security.protocol=SASL_SSL
   sasl.mechanisms=PLAIN
   sasl.username=your_key
   sasl.password=your_secret
   ```
6. cd stream-data-integration and install the requirements
7. Execute commands in terminal
    ```
    python producer.py
    ```
8. The producer successfully push data into the topic
    ![producer](<images/kafka_stream/confluent producer.png>)
    ![topic](<images/kafka_stream/conflunent topic overview.png>)

9. Set up consumer by going to the connectors and choose `Amazon S3 Sink`.
10. Configure the S3 Sink by using aws key /secret key /bucket name, etc and run it. 
    ![S3](<images/kafka_stream/S3Sink consumer.png>)
    






