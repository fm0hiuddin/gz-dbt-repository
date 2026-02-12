select
date_date,
ROUND(SUM(ads_cost),2) as day_ads_cost,
ROUND(SUM(impression),2) as day_impression,
ROUND(SUM(click),2) as day_click
from {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC