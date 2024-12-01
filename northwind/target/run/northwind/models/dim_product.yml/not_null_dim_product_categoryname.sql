select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select categoryname
from analytics.dbt_vezangen.dim_product
where categoryname is null



      
    ) dbt_internal_test