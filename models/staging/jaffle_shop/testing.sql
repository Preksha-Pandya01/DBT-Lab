-- select * from raw.jaffle_shop.products

select * from {{source('jaffle_shop','stores')}}