
-- with orders as  (
--     select * from {{ ref ('stg_jaffle_shop__orders' )}}
-- ),

-- payments as (
--     select * from {{ ref ('stg_stripe__payments') }}
-- ),

-- order_payments as (
--     select
--         orderid as order_id,
--         sum (case when status = 'success' then amount end) as amount

--     from {{source('stripe','payment')}}
--     group by 1
-- ),

--  final as (

--     select
--         orders.order_id as order_id,
--         orders.customer_id as customer_id,
--         orders.order_date as order_date,
--         coalesce (order_payments.amount, 0) as amount

--     from orders
--     left join order_payments using (order_id)
-- )


-- select * from final
-- order by order_date desc

{{
    config(
        materialized='incremental'
    )
}}
with orders as  (
    select * from {{ ref ('stg_jaffle_shop__orders' )}}
),

payments as (
    select * from {{ ref ('stg_stripe__payments') }}
),

order_payments as (
    select
        order_id,
        sum (case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

 final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final


{% if is_incremental() %}
where
order_date >= (select max(order_date) from {{this}})
{% endif %}