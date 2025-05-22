#!/bin/bash

# Variables
RESOURCE_GROUP="testRG"
LOCATION="westus"
SQL_SERVER_NAME="inventorysql$RANDOM"
SQL_ADMIN_USER="username"
SQL_ADMIN_PASSWORD="password"  # You should generate a stronger password
SQL_DB_NAME="inventorydb"

# Create Resource Group (if not exist)
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Azure SQL Server
az sql server create \
  --name $SQL_SERVER_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --admin-user $SQL_ADMIN_USER \
  --admin-password $SQL_ADMIN_PASSWORD

# Create Azure SQL Database
az sql db create \
  --resource-group $RESOURCE_GROUP \
  --server $SQL_SERVER_NAME \
  --name $SQL_DB_NAME \
  --service-objective S0


# Output connection info
echo "✅ Azure SQL setup completed."
echo "Server Name: $SQL_SERVER_NAME.database.windows.net"
echo "Database: $SQL_DB_NAME"
echo "Username: $SQL_ADMIN_USER"
