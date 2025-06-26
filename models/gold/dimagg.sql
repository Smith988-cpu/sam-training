{{config(
    materialized= 'table',
    database= 'GOLD',
    schema= 'PUBLIC'
)}}
select count(*) as total_customers
from {{ref("dimsilver")}}