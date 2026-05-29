
DROP PROCEDURE IF EXISTS bronze.create_bronze_tables;
GO

CREATE PROCEDURE bronze.create_bronze_tables AS
BEGIN
	BEGIN TRY

		PRINT '------------------------------------------'
		PRINT 'Creating CRM tables'
		PRINT '------------------------------------------'

		DROP TABLE IF EXISTS bronze.crm_cust_info;

		PRINT 'Creating crm_cust_info'

		CREATE TABLE bronze.crm_cust_info (
			cst_id INT,
			cst_key NVARCHAR(50),
			cst_firstname NVARCHAR(50),
			cst_lastname NVARCHAR(50),
			cst_marital_status CHAR(2),
			cst_gndr CHAR(2),
			cst_create_date DATE
		);

		PRINT 'crm_cust_info created'

		PRINT 'Creating crm_prd_info'

		DROP TABLE IF EXISTS bronze.crm_prd_info; 

		CREATE TABLE bronze.crm_prd_info (
			prd_id INT,
			prd_key NVARCHAR(50),
			prd_nm NVARCHAR(50),
			prd_cost INT,
			prd_line CHAR(2),
			prd_start_dt DATE,
			prd_end_dt DATE
		);

		PRINT 'crm_prd_info created'

		PRINT 'Creating crm_sales_details'

		DROP TABLE IF EXISTS bronze.crm_sales_details

		CREATE TABLE bronze.crm_sales_details(
			sls_ord_num NVARCHAR(50),
			sls_prd_key NVARCHAR(50),
			sls_cust_id INT,
			sls_order_dt INT,
			sls_ship_dt INT,
			sls_due_dt INT,
			sls_sales INT,
			sls_quantity INT,
			sls_price INT
		);

		PRINT 'crm_sales_details created'

		PRINT '------------------------------------------'
		PRINT 'ALL CRM Tables created'
		PRINT '------------------------------------------'

		PRINT '------------------------------------------'
		PRINT 'Creating ERP Tables'
		PRINT '------------------------------------------'


		PRINT 'Creating erp_cust_az12'

		DROP TABLE IF EXISTS bronze.erp_cust_az12;

		CREATE TABLE bronze.erp_cust_az12 (
			cid	NVARCHAR(50),
			bdate DATE,
			gen NVARCHAR(10)
		);

		PRINT 'erp_cust_az12 created'

		PRINT 'Creating erp_loc_a101'

		DROP TABLE IF EXISTS bronze.erp_loc_a101;

		CREATE TABLE bronze.erp_loc_a101 (
			cid	NVARCHAR(50),
			cntry NVARCHAR(50)
		);

		PRINT 'erp_loc_a101 created'

		PRINT 'Creating erp_px_cat_g1v2'
		DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

		CREATE TABLE bronze.erp_px_cat_g1v2 (
			id NVARCHAR(20),
			cat NVARCHAR(30),
			subcat NVARCHAR(50),
			maintenance NVARCHAR(10)
		);

		PRINT 'erp_px_cat_g1v2 created'

		PRINT '------------------------------------------'
		PRINT 'ALL ERP Tables created'
		PRINT '------------------------------------------'

	END TRY

	BEGIN CATCH
		PRINT 'ERROR LOADING TABLES'
	END CATCH
END;
GO

EXEC bronze.create_bronze_tables;    