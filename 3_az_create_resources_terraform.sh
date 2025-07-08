#!/bin/bash

# Calcular valores base
INICIALES="<INICIALES>"
SUBSCRIPTION_ID="<SUSCRIPCION>"

# Configurar la suscripción
az account set --subscription $SUBSCRIPTION_ID

# Variables de entorno
RESOURCE_GROUP="az-${INICIALES}-dev-de-rg-tf"
LOCATION="East US"
STORAGE_ACCOUNT="az${INICIALES}devdedlstf"
CONTAINER_NAME="terraform"


# Crear Resource Group
echo "-------------------------------------------------"
echo ">> Creando Resource Group: $RESOURCE_GROUP"
az group create --name $RESOURCE_GROUP --location "$LOCATION"

# Crear Storage Account (Para Terraform State y Data Lake)
echo "-------------------------------------------------"
echo ">> Creando Storage Account: $STORAGE_ACCOUNT"
az storage account create --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --location "$LOCATION" --sku Standard_LRS --kind StorageV2

# Obtener clave de acceso del Storage Account
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query "[0].value" --output tsv)

# Crear Container para el Terraform State
echo "-------------------------------------------------"
echo ">> Creando Container: $CONTAINER_NAME"
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT --account-key $STORAGE_KEY


