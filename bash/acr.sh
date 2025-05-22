#!/bin/bash

# Variables
RESOURCE_GROUP="testRG"
ACR_NAME="testacr$RANDOM"  # Make the name unique globally
LOCATION="westus"          # Change as needed
SKU="Basic"                # Can be Basic, Standard, or Premium

# Create ACR
echo "Creating Azure Container Registry: $ACR_NAME in resource group: $RESOURCE_GROUP..."
az acr create \
  --resource-group $RESOURCE_GROUP \
  --name $ACR_NAME \
  --sku $SKU \
  --location $LOCATION \
  --admin-enabled true

# Output registry details
echo "Azure Container Registry '$ACR_NAME' created successfully."
az acr show --name $ACR_NAME --resource-group $RESOURCE_GROUP --output table
