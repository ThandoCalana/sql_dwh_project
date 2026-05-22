
/*
    CREATE DB & SCHEMAS

	This script creates a new database called 'DataWarehouse' after checking for its existence.
	If it exists, the database is dropped and then recreated.
	The script also then creates the bronze, silver and gold schemas which will be used within the database
*/


-- Create DB 'DataWarehouse'
USE master;
GO

-- Drop and recreate the DB if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO