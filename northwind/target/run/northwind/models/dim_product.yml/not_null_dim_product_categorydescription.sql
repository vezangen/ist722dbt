select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select categorydescription
from analytics.dbt_vezangen.dim_product
where categorydescription is null



      
    ) dbt_internal_test