
  
    

        create or replace transient table analytics.dbt_vezangen.dim_product
         as
        (with
    stg_products as (select * from raw.northwind.Products),
    stg_categories as (select * from raw.northwind.Categories)
select
    md5(cast(coalesce(cast(stg_products.productid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as productkey,
    stg_products.productid,
    stg_products.productname,
    stg_products.supplierid,
    stg_categories.categoryname,
    stg_categories.description
from stg_products
left join stg_categories on stg_products.categoryid = stg_categories.categoryid
        );
      
  