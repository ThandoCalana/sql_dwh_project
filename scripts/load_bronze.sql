
CREATE PROCEDURE bronze.load_bronze AS
BEGIN

	DROP TABLE IF EXISTS bronze.crm_cust_info;

	CREATE TABLE bronze.crm_cust_info (
		cst_id INT,
		cst_key NVARCHAR(50),
		cst_firstname NVARCHAR(20),
		cst_lastname NVARCHAR(20),
		cst_marital_status CHAR(2),
		cst_gndr CHAR(2),
		cst_create_date DATE
	);

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

	DROP TABLE IF EXISTS bronze.crm_sales_details

	CREATE TABLE bronze.crm_sales_details(
		sls_ord_num NVARCHAR(50),
		sls_prd_key NVARCHAR(50),
		sls_cust_id INT,
		sls_order_dt DATE,
		sls_ship_dt DATE,
		sls_due_dt DATE,
		sls_sales INT,
		sls_quantity INT,
		sls_price INT
	);
END;
GO

EXEC bronze.load_bronze;    