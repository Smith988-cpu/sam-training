select * from 
{{ref("fact_orders")}} o
{{ref("dim")}} c on o.CUSTOMER_ID=c.CUSTOMER_ID