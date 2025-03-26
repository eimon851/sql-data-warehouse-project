/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the bronze dataset, replacing exisiting tables
    if they already exist
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


create or replace table `datawarehouse-454113.bronze.crm_cust_info`
(
cst_id int64
, cst_key string
, cst_firstname string
, cst_lastname string
, cst_marital_status string
, cst_gndr string
, cst_create_date date
);

create or replace table `datawarehouse-454113.bronze.crm_prd_info`
(
prd_id int64
, prd_key string
, prd_nm string
, prd_cost int64
, prd_line string
, prd_start_dt date
, prd_end_dt date
);

create or replace table `datawarehouse-454113.bronze.crm_sales_details`
(
sls_ord_num string
, sls_prd_key string
, sls_cust_id int64
, sls_order_dt int64
, sls_ship_dt int64
, sls_due_dt int64
, sls_sales int64
, sls_quantity int64
, sls_price int64
);

create or replace table `datawarehouse-454113.bronze.erp_cust_az12`
(
cid string
, bdate date
, gen string
);

create or replace table `datawarehouse-454113.bronze.erp_loc_a101`
(
cid string
, cntry string
, id int64
);

create or replace table `datawarehouse-454113.bronze.erp_px_cat_g1v2`
(
id string
, cat string 
, subcat string 
, maintenance boolean
);



