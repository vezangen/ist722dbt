select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select extendedpriceamount
from analytics.dbt_vezangen.fact_sales
where extendedpriceamount is null



      
    ) dbt_internal_test