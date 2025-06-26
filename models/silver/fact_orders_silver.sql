{{config(
    materialized= 'view',
    database= 'SILVER',
    schema= 'PUBLIC')}} 

select 
o.ORDER_ID,o.CUSTOMER_ID,o.PRODUCT_ID,
FIRST_NAME || ' ' || LAST_NAME as CUSTOMERNAME,
o.ORDER_DATE,O.TOTAL_AMOUNT from 
{{ref("fact_orders")}} o join
{{ref("dim")}} c on o.CUSTOMER_ID=c.CUSTOMER_ID
left join {{ref("country_codes")}} cc on cc.COUNTRY=c.COUNTRY