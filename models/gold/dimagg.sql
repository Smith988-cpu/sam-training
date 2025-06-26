{{config(
    materialized= 'table',
    database= 'GOLD',
    schema= 'PUBLIC'
)}}
select country,count(*) as total_customers
from {{ref("dimsilver")}}
group by country
order by total_customers desc