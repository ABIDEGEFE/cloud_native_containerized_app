#!/bin/bash

# Variables
RESOURCE_GROUP="testRG"
ACI_NAME="fastapi-backend-aci"
IMAGE="testacr7219.azurecr.io/fastapi-backend:v2"
ACR_NAME="testacr7219"
ACI_DNS_LABEL="fastapibackendpublic"
LOCATION="westus"  # Adjust if needed
PORT=8000
CPU=1.0           # CPU cores (e.g., 0.5, 1, 2)
MEMORY=1.5        # Memory in GB (e.g., 1, 1.5, 2)

# Create ACI
az container create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$ACI_NAME" \
  --image "$IMAGE" \
  --dns-name-label "$ACI_DNS_LABEL" \
  --ports $PORT \
  --os-type Linux \
  --location "$LOCATION" \
  --cpu "$CPU" \
  --memory "$MEMORY" \
  --registry-login-server "$ACR_NAME.azurecr.io" \
  --registry-username "$(az acr credential show --name $ACR_NAME --query username -o tsv)" \
  --registry-password "$(az acr credential show --name $ACR_NAME --query passwords[0].value -o tsv)" \
  --restart-policy Always

# Output the FQDN
echo "✅ ACI deployed. Access your app at:"
echo "http://${ACI_DNS_LABEL}.${LOCATION}.azurecontainer.io:${PORT}"
