
    
    

select
    OrderId as unique_field,
    count(*) as n_records

from analytics.dbt_vezangen.fact_sales
where OrderId is not null
group by OrderId
having count(*) > 1


