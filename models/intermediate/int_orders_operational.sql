select
    m.orders_id,
    m.date_date,
    m.quantity,
    m.margin, 
    m.revenue,
    m.purchase_cost,
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost,
    ROUND(m.margin+sh.shipping_fee-sh.logcost-sh.ship_cost,2) as operational_margin
from {{ref("int_orders_margin")}} m
left join {{ref("stg_raw__ship")}} sh
    using (orders_id)
order by date_date desc
