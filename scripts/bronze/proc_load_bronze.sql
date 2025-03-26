/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the bronze schema from external csv files stored 
    in google cloud storage. It performs the following actions:
    - Truncates the bronze table before loading data
    - Uses the load data command to load data from csv to the bronze table

Parameters:
    - None. Does not accept any values or returns any value

Usage Example:
    - call `datawarehouse-454113.bronze.load_bronze`();
===============================================================================
*/

create or replace procedure `datawarehouse-454113.bronze.load_bronze` ()
begin

truncate table datawarehouse-454113.bronze.crm_cust_info;
load data into datawarehouse-454113.bronze.crm_cust_info
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_crm/cust_info.csv']
);

truncate table datawarehouse-454113.bronze.crm_prd_info;
load data into datawarehouse-454113.bronze.crm_prd_info
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_crm/prd_info.csv']
);

truncate table datawarehouse-454113.bronze.crm_sales_details;
load data into datawarehouse-454113.bronze.crm_sales_details
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_crm/sales_details.csv']
);

truncate table datawarehouse-454113.bronze.erp_cust_az12;
load data into datawarehouse-454113.bronze.erp_cust_az12
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_erp/CUST_AZ12.csv']
);

truncate table datawarehouse-454113.bronze.erp_loc_a101;
load data into datawarehouse-454113.bronze.erp_loc_a101
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_erp/LOC_A101.csv']
);

truncate table datawarehouse-454113.bronze.erp_px_cat_g1v2;
load data into datawarehouse-454113.bronze.erp_px_cat_g1v2
from files
(
  format = 'csv'
  , skip_leading_rows = 1
  , field_delimiter = ','
  , uris = ['gs://datawarehouse-bucket-12/source_erp/PX_CAT_G1V2.csv']
);
end




