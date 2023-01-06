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

3. Questions for analysis: Qt of referral per day, month, quarter, partner, contact and country