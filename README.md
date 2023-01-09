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
3. I also created a [dashboard](https://lightdashggjoao.herokuapp.com/projects/105d962a-8a0e-4a3e-a674-f85a4e49378e/dashboards/9393bab8-dd52-4b4c-838e-c834cd857193/view) to visualize some metrics, you can access using:
    ```
    user: me@joaocecilio.com
    pass: Getground2023
    ```
