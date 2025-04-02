/*
===============================================================================
DDL Script: Create silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the silver dataset, replacing exisiting tables
    if they already exist
    Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/


create or replace table `datawarehouse-454113.silver.crm_cust_info`
(
cst_id int64
, cst_key string
, cst_firstname string
, cst_lastname string
, cst_marital_status string
, cst_gndr string
, cst_create_date date
, dwh_create_date timestamp default current_timestamp()
);

create or replace table `datawarehouse-454113.silver.crm_prd_info`
(
prd_id int64
, cat_id string
, prd_key string
, prd_nm string
, prd_cost int64
, prd_line string
, prd_start_dt date
, prd_end_dt date
, dwh_create_date timestamp default current_timestamp()
);

create or replace table `datawarehouse-454113.silver.crm_sales_details`
(
sls_ord_num string
, sls_prd_key string
, sls_cust_id int64
, sls_order_dt date
, sls_ship_dt date
, sls_due_dt date
, sls_sales int64
, sls_quantity int64
, sls_price int64
, dwh_create_date timestamp default current_timestamp()
);

create or replace table `datawarehouse-454113.silver.erp_cust_az12`
(
cid string
, bdate date
, gen string
, dwh_create_date timestamp default current_timestamp()
);

create or replace table `datawarehouse-454113.silver.erp_loc_a101`
(
cid string
, cntry string
, id int64
, dwh_create_date timestamp default current_timestamp()
);

create or replace table `datawarehouse-454113.silver.erp_px_cat_g1v2`
(
id string
, cat string 
, subcat string 
, maintenance string
, dwh_create_date timestamp default current_timestamp()
);



