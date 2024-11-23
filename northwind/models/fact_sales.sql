with stg_orders as 
(
    select 
    OrderId,
        {{ dbt_utils.generate_surrogate_key(['employeeid']) }} as employeekey, 
        {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customerkey, 
        {{ dbt_utils.generate_surrogate_key(['orderdate']) }} as orderdatekey  
    from {{source('northwind','Orders')}}
),
stg_order_details as
(
    select 
    OrderId,
        {{ dbt_utils.generate_surrogate_key(['productid']) }} as productkey,
    sum(Quantity) as quantity, 
    sum(Quantity*UnitPrice) as extendedpriceamount,
    sum((Quantity*UnitPrice)*Discount) as discountamount,
    sum(((Quantity*UnitPrice))-((Quantity*UnitPrice)*Discount)) as soldamount
    from {{source('northwind','Order_Details')}}
    group by orderid,productkey
)
select 
    stg_orders.Orderid,
    stg_orders.employeekey,
    stg_orders.customerkey,
    stg_orders.orderdatekey,
    stg_order_details.productkey,
    stg_order_details.quantity,
    stg_order_details.extendedpriceamount,
    stg_order_details.discountamount,
    stg_order_details.soldamount
from stg_orders
left join stg_order_details on stg_orders.OrderId = stg_order_details.OrderId