With subquery as (

select
* EXCEPT (date_date),
EXTRACT(MONTH FROM date_date) as datemonth
from{{ ref('finance_campaigns_day') }}

)

select
datemonth,
ROUND(SUM(ads_margin),2) as ads_margin,
ROUND(SUM(average_basket),2) as average_basket,
ROUND(SUM(op_margin),2) as operational_margin,
ROUND(SUM(day_ads_cost),2) as ads_cost,
ROUND(SUM(day_impression),2) as ads_impression,
ROUND(SUM(day_click),2) as ads_click,
ROUND(SUM(tot_quantity),2) as quantity,
ROUND(SUM(tot_revenue),2) as revenue,
ROUND(SUM(tot_purchase_cost),2) as purchase_cost,
ROUND(SUM(margin),2) as margin,
ROUND(SUM(tot_shipping_fee),2) as shipping_fee,
ROUND(SUM(tot_logcost),2) as log_cost,
ROUND(SUM(tot_shipcost),2) as ship_cost,
from subquery
group by datemonth