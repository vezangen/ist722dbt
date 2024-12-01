
  
    

        create or replace transient table analytics.dbt_vezangen.fact_sales
         as
        (with stg_orders as 
(
    select 
    OrderId,
        md5(cast(coalesce(cast(employeeid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as employeekey, 
        md5(cast(coalesce(cast(customerid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customerkey, 
        md5(cast(coalesce(cast(orderdate as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as orderdatekey  
    from raw.northwind.Orders
),
stg_order_details as
(
    select 
    OrderId,
        md5(cast(coalesce(cast(productid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as productkey,
    sum(Quantity) as quantity, 
    sum(Quantity*UnitPrice) as extendedpriceamount,
    sum((Quantity*UnitPrice)*Discount) as discountamount,
    sum(((Quantity*UnitPrice))-((Quantity*UnitPrice)*Discount)) as soldamount
    from raw.northwind.Order_Details
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
        );
      
  