#!/bin/bash

# Script para iniciar a conexão OpenVPN dentro do contêiner.

OVPN_PATH="/vpn"

# Verifica se OVPN_CONFIG_FILE está definido
if [ -n "$OVPN_CONFIG_FILE" ]; then
  OVPN_FILE="${OVPN_PATH}/${OVPN_CONFIG_FILE}"
  if [ ! -f "$OVPN_FILE" ]; then
    echo "====================================================================="
    echo "!!! ERRO DE CONFIGURAÇÃO .OVPN !!!"
    echo "---------------------------------------------------------------------"
    echo "Erro: O arquivo .ovpn especificado em OVPN_CONFIG_FILE não foi encontrado."
    echo "Arquivo esperado: ${OVPN_FILE}"
    echo "Por favor, verifique se a variável de ambiente OVPN_CONFIG_FILE está correta"
    echo "e se o arquivo existe na pasta 'vpn/' na raiz do seu projeto."
    echo "---------------------------------------------------------------------"
    echo "A conexão VPN NÃO foi iniciada automaticamente."
    echo "====================================================================="
    exit 1;
  fi
else
  # Se OVPN_CONFIG_FILE não estiver definido, tenta encontrar um único arquivo .ovpn
  OVPN_FILES=(${OVPN_PATH}/*.ovpn);

  if [ ${#OVPN_FILES[@]} -eq 0 ]; then
    echo "====================================================================="
    echo "!!! ATENÇÃO: ARQUIVO .OVPN AUSENTE OU AMBÍGUO !!!"
    echo "---------------------------------------------------------------------"
    echo "Erro: Nenhum arquivo .ovpn encontrado na pasta /vpn."
    echo "Por favor, coloque *apenas um* arquivo de configuração .ovpn do Hack The Box"
    echo "dentro da pasta 'vpn/' na raiz do seu projeto, OU defina a variável de ambiente OVPN_CONFIG_FILE."
    echo "---------------------------------------------------------------------"
    echo "A conexão VPN NÃO foi iniciada automaticamente."
    echo "====================================================================="
    exit 1;
  elif [ ${#OVPN_FILES[@]} -gt 1 ]; then
    echo "====================================================================="
    echo "!!! ATENÇÃO: MÚLTIPLOS ARQUIVOS .OVPN !!!"
    echo "---------------------------------------------------------------------"
    echo "Erro: Mais de um arquivo .ovpn encontrado na pasta /vpn."
    echo "Por favor, defina a variável de ambiente OVPN_CONFIG_FILE no seu arquivo .env"
    echo "para especificar qual arquivo .ovpn deve ser usado."
    echo "Exemplo: OVPN_CONFIG_FILE=meu_arquivo.ovpn"
    echo "---------------------------------------------------------------------"
    echo "A conexão VPN NÃO foi iniciada automaticamente."
    echo "====================================================================="
    exit 1;
  else
    OVPN_FILE=${OVPN_FILES[0]}
  fi
fi

echo "Iniciando OpenVPN com ${OVPN_FILE}..."
# Executa o OpenVPN em segundo plano e redireciona a saída para um log
openvpn ${OVPN_FILE} > /var/log/openvpn.log 2>&1 &
echo "OpenVPN iniciado. Verifique /var/log/openvpn.log para detalhes."

# Mantém o contêiner em execução
tail -f /dev/null