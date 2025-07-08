#!/bin/bash

# Lista de grupos de recursos a eliminar
GRUPOS=(
  "az-<INICIALES>-dev-de-rg-dataops"
  "az-<INICIALES>-prd-de-rg-dataops"
  "az-<INICIALES>-dev-de-rg-tf"
)

echo ">>  Este script eliminará los siguientes grupos de recursos y todo su contenido:"
for grupo in "${GRUPOS[@]}"; do
  echo " - $grupo"
done

read -p "¿Estás seguro que deseas continuar? (s/n): " CONFIRMACION

if [[ "$CONFIRMACION" != "s" && "$CONFIRMACION" != "S" ]]; then
  echo ">> Operación cancelada por el usuario."
  exit 1
fi

# Eliminar los grupos
for grupo in "${GRUPOS[@]}"; do
  echo ">>> Eliminando grupo de recursos: $grupo..."
  az group delete --name "$grupo" --yes --no-wait
done

echo ">>  Solicitudes de eliminación enviadas. Los recursos pueden tardar unos minutos en eliminarse."
