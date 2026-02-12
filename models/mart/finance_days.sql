{{ config(materialized= "table") }}

select
    date_date,
    COUNT(orders_id) as tot_transactions,
    ROUND(SUM(revenue),2) as tot_revenue,
    ROUND(SUM(revenue)/COUNT(orders_id),2) as average_basket,
    ROUND(SUM(operational_margin),2) as op_margin,
    ROUND(SUM(purchase_cost),2) as tot_purchase_cost,
    ROUND(SUM(shipping_fee),2) as tot_shipping_fee,
    ROUND(SUM(logcost),2) as tot_logcost,
    ROUND(SUM(quantity),2) as tot_quantity
from {{ref("int_orders_operational")}}
Group by date_date