#!/bin/bash

# Script para iniciar a conexão OpenVPN dentro do contêiner.

OVPN_FILE=""

# Prioridade 1: Arquivo .ovpn específico do desafio (se CHALLENGE_NAME estiver definido)
if [ -n "$CHALLENGE_NAME" ]; then
  CHALLENGE_OVPN_FILE="/workspace/challenges/${CHALLENGE_NAME}/${CHALLENGE_NAME}.ovpn"
  if [ -f "$CHALLENGE_OVPN_FILE" ]; then
    OVPN_FILE="$CHALLENGE_OVPN_FILE"
    echo "Usando arquivo .ovpn do desafio: ${OVPN_FILE}"
  else
    echo "Aviso: CHALLENGE_NAME definido como '${CHALLENGE_NAME}', mas o arquivo .ovpn específico do desafio não foi encontrado em ${CHALLENGE_OVPN_FILE}."
  fi
fi

# Prioridade 2: global.ovpn na raiz do repositório (fallback)
if [ -z "$OVPN_FILE" ]; then
  GLOBAL_OVPN_FILE="/workspace/global.ovpn"
  if [ -f "$GLOBAL_OVPN_FILE" ]; then
    OVPN_FILE="$GLOBAL_OVPN_FILE"
    echo "Usando arquivo .ovpn global: ${OVPN_FILE}"
  else
    echo "Aviso: global.ovpn não encontrado em ${GLOBAL_OVPN_FILE}."
  fi
fi

# Verifica se um arquivo .ovpn foi encontrado
if [ -z "$OVPN_FILE" ]; then
  echo "====================================================================="
  echo "!!! ERRO: NENHUM ARQUIVO .OVPN ENCONTRADO !!!"
  echo "---------------------------------------------------------------------"
  echo "Não foi possível encontrar um arquivo .ovpn para iniciar a VPN."
  echo "Por favor, certifique-se de que um dos seguintes arquivos exista:"
  echo "  - /challenges/<nome_do_desafio>/<nome_do_desafio>.ovpn (se CHALLENGE_NAME estiver definido)"
  echo "  - /global.ovpn (na raiz do projeto)"
  echo "---------------------------------------------------------------------"
  echo "A conexão VPN NÃO foi iniciada automaticamente."
  echo "====================================================================="
  exit 1;
fi

echo "Iniciando OpenVPN com ${OVPN_FILE}..."
# Executa o OpenVPN em segundo plano e redireciona a saída para um log
openvpn ${OVPN_FILE} > /var/log/openvpn.log 2>&1 &
echo "OpenVPN iniciado. Verifique /var/log/openvpn.log para detalhes."

# Mantém o contêiner em execução
tail -f /dev/null
