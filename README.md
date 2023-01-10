## Challenge solution

### How to run locally

1. Assuming you have dbt installed (if not, run: ```pip install -r requirements.txt```):

2. Clone this repo
Set up ```profiles.yml``` to connect to a bigquery porject and run:
    ```
    dbt deps
    dbt seed
    dbt run
    dbt snapshot
    dbt test
    dbt docs generate
    dbt docs serve
    ```
3. About the challenge: First, I uploaded the data to the bigquery, as it is the database I am used to working with nowadays. I used ```dbt seeds``` for that. I handled the necessary data in a staging layer, creating a ```macro``` for converting the date field into a better viewable format, writing some sample tests as well. In terms of creating queries to analyze the data, I used dbt metrics by integrating this layer into a BI tool (access instructions below). To show some sqls , I put some analysis examples in the examples folder. In terms of suggestion, I believe it is necessary to understand the discrepancy in the referral solution time and why some partners/countrys have a better result, but for that more data would be needed.

4. As a plus,  also created a [dashboard](https://lightdashggjoao.herokuapp.com/projects/105d962a-8a0e-4a3e-a674-f85a4e49378e/dashboards/9393bab8-dd52-4b4c-838e-c834cd857193/view) to visualize some metrics, you can access using:
    ```
    user: me@joaocecilio.com
    pass: Getground2023
    ```
