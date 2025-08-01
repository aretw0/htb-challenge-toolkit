#!/bin/bash

# Script para iniciar a conexão OpenVPN dentro do contêiner.
# Uso: connect_vpn.sh [caminho/para/seu/arquivo.ovpn]
# Se nenhum caminho for fornecido, tentará usar /workspace/global.ovpn.

OVPN_FILE=""

# Verifica se um argumento foi fornecido
if [ -n "$1" ]; then
  # Se um argumento foi fornecido, usa-o como o caminho do arquivo OVPN
  OVPN_FILE="/workspace/$1"
  echo "Tentando usar arquivo .ovpn especificado: ${OVPN_FILE}"
else
  # Caso contrário, tenta usar global.ovpn como padrão
  OVPN_FILE="/workspace/global.ovpn"
  echo "Nenhum arquivo .ovpn especificado. Tentando usar o padrão: ${OVPN_FILE}"
fi

# Verifica se o arquivo .ovpn existe
if [ ! -f "$OVPN_FILE" ]; then
  echo "====================================================================="
  echo "!!! ERRO: ARQUIVO .OVPN NÃO ENCONTRADO !!!"
  echo "---------------------------------------------------------------------"
  echo "O arquivo .ovpn especificado ou o padrão (${OVPN_FILE}) não foi encontrado."
  echo "Por favor, certifique-se de que o caminho está correto e o arquivo existe."
  echo "---------------------------------------------------------------------"
  echo "A conexão VPN NÃO foi iniciada."
  echo "====================================================================="
  exit 1;
fi

echo "Iniciando OpenVPN com ${OVPN_FILE}..."
# Executa o OpenVPN em segundo plano e redireciona a saída para um log
openvpn ${OVPN_FILE} > /var/log/openvpn.log 2>&1 &
echo "OpenVPN iniciado. Verifique /var/log/openvpn.log para detalhes."

# O script termina aqui. O contêiner permanece em execução.