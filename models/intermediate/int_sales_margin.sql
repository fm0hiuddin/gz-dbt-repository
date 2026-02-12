  
    select
            s.date_date,
            s.orders_id,
            s.products_id,
            s.revenue,
            s.quantity,
            p.purchase_price, --calculation follows
            ROUND(s.revenue-(s.quantity*p.purchase_price),2) as margin,
            ROUND(s.quantity*p.purchase_price,2) as purchase_cost,
            {{ margin_percent( 's.revenue' ,  'p.purchase_price' ) }} AS margin_percent
    from {{ref("stg_raw__sales")}} s
    left join {{ref("stg_raw__product")}} p
    using (products_id)
