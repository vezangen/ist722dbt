select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select productkey
from analytics.dbt_vezangen.dim_product
where productkey is null



      
    ) dbt_internal_test