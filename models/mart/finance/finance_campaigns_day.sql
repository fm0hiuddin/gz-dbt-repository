select
fd.date_date,
ROUND(fd.op_margin-cd.day_ads_cost,2) as ads_margin,
fd.average_basket,
fd.op_margin,
cd.day_ads_cost,
cd.day_impression,
cd.day_click,
fd.tot_quantity,
fd.tot_revenue,
fd.tot_purchase_cost,
ROUND(fd.tot_revenue-fd.tot_purchase_cost,2) as margin,
fd.tot_shipping_fee,
fd.tot_logcost,
fd.tot_shipcost
from{{ ref('finance_days') }} fd
left join {{ ref('int_campaigns_day') }} cd
using (date_date)
order by date_date desc 