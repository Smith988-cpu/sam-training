select 
* from 
{{ref("fact_orders")}} o join
{{ref("dim")}} c on o.CUSTOMER_ID=c.CUSTOMER_ID
left join {{ref("country_codes")}} cc on cc.COUNTRY=c.COUNTRY