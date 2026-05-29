/*
------------------------------------------------------------------------------
Stored Procedure: Load Bronze Layer (Source -> Bronze)
------------------------------------------------------------------------------
Script Purpose:
    This stored procedure performs the ingestion process to 
    populate the 'bronze' schema tables from the source (CSV files).
	Actions Performed:
		- Truncates Bronze tables.
		- Inserts raw data from CSV

Usage Example:
    EXEC bronze.load_bronze;
------------------------------------------------------------------------------
*/


DROP PROCEDURE IF EXISTS load_bronze;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;

	BEGIN TRY

		PRINT '------------------------------------------------'
		PRINT 'Loading CRM Tables'
		PRINT '------------------------------------------------'

		TRUNCATE TABLE bronze.crm_cust_info;
		
		SET @start_time = GETDATE();
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\cust_info.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT 'Load Duration of bronze.crm_cust_info table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		TRUNCATE TABLE bronze.crm_prd_info;

		SET @start_time = GETDATE();
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\prd_info.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT '>> Load Duration of bronze.crm_prd_info table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		TRUNCATE TABLE bronze.crm_sales_details;

		SET @start_time = GETDATE();
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\sales_details.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT '>> Load Duration of bronze.crm_sales_details table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		PRINT ' ';
		PRINT '------------------------------------------------';
		PRINT 'CRM Tables Loaded';
		PRINT '------------------------------------------------';


		
		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';

		TRUNCATE TABLE bronze.erp_cust_az12 ;
		
		SET @start_time = GETDATE();
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT 'Load Duration of bronze.erp_cust_az12 table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		TRUNCATE TABLE bronze.erp_loc_a101;

		SET @start_time = GETDATE();
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT '>> Load Duration of bronze.erp_loc_a101 table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		SET @start_time = GETDATE();
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n'
			);

		SET @end_time = GETDATE();
		PRINT '>> Load Duration of bronze.erp_px_cat_g1v2 table: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------------------------------------';

		PRINT ' ';
		PRINT '------------------------------------------------';
		PRINT 'ERP Tables Loaded';
		PRINT '------------------------------------------------';


	END TRY 
	BEGIN CATCH
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
	END CATCH
END;
GO

