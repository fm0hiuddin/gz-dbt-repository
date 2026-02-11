select
    m.orders_id,
    m.date_date,
    ROUND(m.margin+sh.shipping_fee-sh.logcost-sh.ship_cost,2) as operational_margin,
    m.quantity,
    m.margin, 
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost     
from {{ref("int_sales_margin")}} m
left join {{ref("stg_raw__ship")}} sh
    using (orders_id)
order by date_date desc
