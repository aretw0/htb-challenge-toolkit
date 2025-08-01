#!/bin/bash

# Script para iniciar a conexão OpenVPN dentro do contêiner.

# Prioridade 1: OVPN_CONFIG_FILE (variável de ambiente)
if [ -n "$OVPN_CONFIG_FILE" ]; then
  OVPN_FILE="/workspace/${OVPN_CONFIG_FILE}"
  if [ ! -f "$OVPN_FILE" ]; then
    echo "====================================================================="
    echo "!!! ERRO DE CONFIGURAÇÃO .OVPN !!!"
    echo "---------------------------------------------------------------------"
    echo "Erro: O arquivo .ovpn especificado em OVPN_CONFIG_FILE não foi encontrado."
    echo "Arquivo esperado: ${OVPN_FILE}"
    echo "Por favor, verifique se a variável de ambiente OVPN_CONFIG_FILE está correta"
    echo "e se o caminho é relativo à raiz do projeto (ex: challenges/cap/cap.ovpn)."
    echo "---------------------------------------------------------------------"
    echo "A conexão VPN NÃO foi iniciada automaticamente."
    echo "====================================================================="
    exit 1;
  fi
else
  # Prioridade 2: Arquivo .ovpn no diretório de trabalho atual
  # (Funciona para usuários de terminal que navegam para o diretório do desafio)
  CURRENT_DIR_OVPN_FILES=(./*.ovpn);
  if [ ${#CURRENT_DIR_OVPN_FILES[@]} -eq 1 ] && [ -f "${CURRENT_DIR_OVPN_FILES[0]}" ]; then
    OVPN_FILE="${CURRENT_DIR_OVPN_FILES[0]}"
  elif [ ${#CURRENT_DIR_OVPN_FILES[@]} -gt 1 ]; then
    echo "====================================================================="
    echo "!!! ATENÇÃO: MÚLTIPLOS ARQUIVOS .OVPN NO DIRETÓRIO ATUAL !!!"
    echo "---------------------------------------------------------------------"
    echo "Erro: Mais de um arquivo .ovpn encontrado no diretório atual."
    echo "Por favor, defina a variável de ambiente OVPN_CONFIG_FILE no seu arquivo .env"
    echo "para especificar qual arquivo .ovpn deve ser usado, ou remova os extras."
    echo "Exemplo: OVPN_CONFIG_FILE=challenges/cap/cap.ovpn"
    echo "---------------------------------------------------------------------"
    echo "A conexão VPN NÃO foi iniciada automaticamente."
    echo "====================================================================="
    exit 1;
  else
    # Prioridade 3: global.ovpn na raiz do repositório (fallback)
    GLOBAL_OVPN_FILE="/workspace/global.ovpn"
    if [ -f "$GLOBAL_OVPN_FILE" ]; then
      OVPN_FILE="$GLOBAL_OVPN_FILE"
    else
      echo "====================================================================="
      echo "!!! ATENÇÃO: NENHUM ARQUIVO .OVPN ENCONTRADO !!!"
      echo "---------------------------------------------------------------------"
      echo "Erro: Nenhum arquivo .ovpn encontrado no diretório atual, nem global.ovpn na raiz."
      echo "Por favor, coloque um arquivo .ovpn no diretório do desafio, ou crie um global.ovpn na raiz,"
      echo "OU defina a variável de ambiente OVPN_CONFIG_FILE."
      echo "---------------------------------------------------------------------"
      echo "A conexão VPN NÃO foi iniciada automaticamente."
      echo "====================================================================="
      exit 1;
    fi
  fi
fi

echo "Iniciando OpenVPN com ${OVPN_FILE}..."
# Executa o OpenVPN em segundo plano e redireciona a saída para um log
openvpn ${OVPN_FILE} > /var/log/openvpn.log 2>&1 &
echo "OpenVPN iniciado. Verifique /var/log/openvpn.log para detalhes."

# Mantém o contêiner em execução
tail -f /dev/null
