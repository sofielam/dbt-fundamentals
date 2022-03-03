with orders as (
    select order_id,
           customer_id,
           order_date
           ,status
    from {{ ref('stg_orders') }}
),
payment as (
    select *
    from {{ ref('stg_payment') }}
)
select
order_id,
customer_id,
amount
from orders 
inner join payment on orders.order_id = payment.order_id