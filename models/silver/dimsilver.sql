{{config(
    materialized= 'view',
    database= 'SILVER',
    schema= 'PUBLIC'
)}} 
with cte as(
select 
CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL,
row_number() over(partition by EMAIL order by CUSTOMER_ID desc) as dedup
from {{ref("dim")}}
)
select 
CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL,dedup from cte where dedup=1 