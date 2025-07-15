select
    id as order_id,
    CUSTOMER as customer_id,
    ORDERED_AT
    
from {{ source('jaffle_shop','orders')}}