{{config(
    materialized= 'view',
    database= 'BRONZE',
    schema= 'PUBLIC'
)}} 
select * from {{source('raw','RAW_CUSTOMERS')}} 