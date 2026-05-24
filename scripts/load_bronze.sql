DROP PROCEDURE IF EXISTS load_bronze;

CREATE PROCEDURE bronze.load_bronze AS
BEGIN

	TRUNCATE TABLE bronze.crm_cust_info;

	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\cust_info.csv'
	WITH (
		FORMAT = 'CSV',
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n'
		);

	TRUNCATE TABLE bronze.crm_prd_info;

	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\prd_info.csv'
	WITH (
		FORMAT = 'CSV',
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n'
		);

	TRUNCATE TABLE bronze.crm_sales_details;

	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\Tcala\OneDrive\Documents\PDP\sql_dwh_project\datasets\source_crm\sales_details.csv'
	WITH (
		FORMAT = 'CSV',
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n'
		);
END;
GO

EXEC bronze.load_bronze;

