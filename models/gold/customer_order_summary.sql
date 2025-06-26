{{config(
    materialized= 'TABLE',
    database= 'GOLD',
    schema= 'PUBLIC')}} 

select CUSTOMER_ID,
CUSTOMERNAME,
SUM(TOTAL_AMOUNT) as amount,
count(ORDER_ID) as total_orders
from {{ref("fact_orders_silver")}} f
left join {{ref("dimproduct")}} d on f.PRODUCT_ID=d.PRODUCT_ID
group by f.CUSTOMER_ID, f.CUSTOMERNAME