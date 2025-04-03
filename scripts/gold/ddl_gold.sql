/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views in the gold dataset, replacing existing views
    if they already exist

    Each view performs transformation and combines data from the silver layer to generate a clean and business-ready dataset stored in the data warehouse.
    
Usage:
    These views can directly be queries for analytics and reportings
===============================================================================
*/

create or replace view datawarehouse-454113.gold.dim_customers as
select 
row_number() over (order by cst_id) as customer_key
, ci.cst_id as customer_id
, ci.cst_key as customer_number
, ci.cst_firstname as first_name
, ci.cst_lastname as last_name
, la.cntry as country
, ci.cst_marital_status as marital_status
, case when cst_gndr != 'N/A' then cst_gndr 
       else coalesce(gen, 'N/A')
  end as gender
, ca.bdate as birthdate
, ci.cst_create_date as create_date
from datawarehouse-454113.silver.crm_cust_info ci
left join datawarehouse-454113.silver.erp_cust_az12 ca
on        ci.cst_key = ca.cid
left join datawarehouse-454113.silver.erp_loc_a101 la
on        ci.cst_key = la.cid
;

create or replace view datawarehouse-454113.gold.dim_products as
select 
  row_number() over (order by prd_key, prd_start_dt) as product_key
, cp.prd_id as product_id
, cp.prd_key as product_number
, cp.prd_nm as product_name
, cp.cat_id as category_id
, ep.cat as category
, ep.subcat as subcategory
, ep.maintenance
, cp.prd_cost as cost
, cp.prd_line as product_line
, cp.prd_start_dt as start_date
from datawarehouse-454113.silver.crm_prd_info cp
left join datawarehouse-454113.silver.erp_px_cat_g1v2 ep
on        cp.cat_id = ep.id
where prd_end_dt is null -- Filter out all historical data 
; 

create or replace view datawarehouse-454113.gold.fact_sales as
select
sls_ord_num as order_number
, pr.product_key
, cu.customer_key
, sd.sls_order_dt as order_date
, sd.sls_ship_dt as ship_date
, sd.sls_due_dt as due_date
, sd.sls_sales as sales_amount
, sd.sls_quantity as quantity
, sd.sls_price as price
from datawarehouse-454113.silver.crm_sales_details sd
left join datawarehouse-454113.gold.dim_products pr
on sd.sls_prd_key = pr.product_number
left join datawarehouse-454113.gold.dim_customers cu
on sd.sls_cust_id = cu.customer_id
;
