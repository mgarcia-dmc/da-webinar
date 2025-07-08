#!/bin/bash

# Parámetros requeridos
AZP_URL="https://dev.azure.com/mgarcia-dops-test/"           		# Ej: https://dev.azure.com/organizacion
AZP_TOKEN="6JCkJPF05Yvwsmjv8hNXqOS8l1c6UL7uVCp1u3VGwlkIiSBEQ5mFJQQJ99BGACAAAAAoU8qaAAASAZDO3nrU"         			# Personal Access Token (PAT)

AZP_POOL="default"          		# Nombre del agente pool
AZP_AGENT_NAME="devops_cloudshell"  # Nombre del agente (opcional)

# Asignar un nombre de agente por defecto si no se proporciona
AZP_AGENT_NAME=${AZP_AGENT_NAME:-"agente-$(hostname)"}

# Variables internas
INSTALL_DIR="$(pwd)/myagent"
AGENT_VERSION="4.258.1"  # Puedes actualizar esta versión si es necesario

echo ">>  Instalando agente Azure DevOps..."
echo ">>  URL: $AZP_URL"
echo ">>  Pool: $AZP_POOL"
echo ">>  Agente: $AZP_AGENT_NAME"

# Crear carpeta
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

# Descargar e instalar agente
echo ">>  Descargando agente..."
wget https://download.agent.dev.azure.com/agent/$AGENT_VERSION/vsts-agent-linux-x64-$AGENT_VERSION.tar.gz
echo ">>  Descomprimiendo..."
tar zxf vsts-agent-linux-x64-$AGENT_VERSION.tar.gz
rm vsts-agent-linux-x64-$AGENT_VERSION.tar.gz


echo ">> Configurando agente..."
./config.sh --unattended \
  --url "$AZP_URL" \
  --auth pat \
  --token "$AZP_TOKEN" \
  --pool "$AZP_POOL" \
  --agent "$AZP_AGENT_NAME" \
  --acceptTeeEula \
  --replace \
  --work _work

echo ">> Ejecutando el servicio..."
./run.sh

echo ">>  Agente instalado y ejecutándose como servicio en: $INSTALL_DIR"
