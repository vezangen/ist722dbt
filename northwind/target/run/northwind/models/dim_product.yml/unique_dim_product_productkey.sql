select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    productkey as unique_field,
    count(*) as n_records

from analytics.dbt_vezangen.dim_product
where productkey is not null
group by productkey
having count(*) > 1



      
    ) dbt_internal_test