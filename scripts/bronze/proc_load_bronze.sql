/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME 

		PRINT '==================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==================================================================';

		PRINT '------------------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------------------------';
		SET @batch_start_time = GETDATE();
		SET @start_time = GETDATE();
		PRINT '>> Truncate Table: bronze.crm_cust_info ';
		TRUNCATE TABLE bronze.crm_cust_info ;

		PRINT '>> Insert Data Into: bronze.crm_cust_info ';
		BULK INSERT bronze.crm_cust_info 
		FROM 'D:\تحليل بيانات\SQL En\Project\source_crm\cust_info.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncate Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info ;
	
		PRINT '>> Insert Data Into: bronze.crm_prd_info ';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\تحليل بيانات\SQL En\Project\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncate Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Insert Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\تحليل بيانات\SQL En\Project\source_crm\sales_details.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @start_time = GETDATE();
		PRINT '------------------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------------------------';

		PRINT '>> Truncate Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12 ;

		PRINT '>> Insert Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\تحليل بيانات\SQL En\Project\source_erp\CUST_AZ12.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncate Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101 ;

		PRINT '>> Insert Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\تحليل بيانات\SQL En\Project\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncate Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2 ;

		PRINT '>> Insert Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\تحليل بيانات\SQL En\Project\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF(second , @start_time, @end_time ) AS VARCHAR ) + ' second'
		PRINT '-----------------------------'

		SET @batch_end_time = GETDATE();
		PRINT '***************************************************'
		PRINT 'Loading Bronze Layer Is Completed';
		PRINT '   -Total Load Duration: ' +  CAST (DATEDIFF(second , @batch_start_time, @batch_end_time ) AS VARCHAR ) + ' second'
		PRINT '***************************************************'									   
	END TRY
	BEGIN CATCH
		PRINT '===================================================';
		PRINT  'ERROR OUCCRED DURING LOADING BRONZE LAYER';
		PRINT  'ERROR MESSAGE: ' + ERROR_MESSAGE();
		PRINT  'ERROR MESSAGE: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT  'ERROR MESSAGE: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '===================================================';
	END CATCH
END
