#!/bin/bash

# Script para criar a estrutura de pastas e arquivos para um novo desafio HTB.
# Uso: ./create_challenge.sh <NOME_DO_DESAFIO>

# Verifica se o nome do desafio foi fornecido como argumento.
if [ -z "$1" ]; then
  echo "Erro: Nenhum nome de desafio fornecido."
  echo "Uso: $0 <NOME_DO_DESAFIO>"
  exit 1
fi

CHALLENGE_NAME=$1
CHALLENGE_DIR="challenges/${CHALLENGE_NAME}"
TEMPLATE_DIR="templates"
WRITEUP_TEMPLATE="${TEMPLATE_DIR}/WRITEUP_TEMPLATE.md"

# Verifica se a pasta do desafio já existe
if [ -d "$CHALLENGE_DIR" ]; then
  echo "Erro: A pasta do desafio '${CHALLENGE_DIR}' já existe."
  exit 1
fi

# Cria a pasta do desafio
  mkdir -p "$CHALLENGE_DIR"
  mkdir -p "${CHALLENGE_DIR}/scans"

# Copia o template do WRITEUP.md e substitui os placeholders
cp "$WRITEUP_TEMPLATE" "${CHALLENGE_DIR}/WRITEUP.md"

# Substitui placeholders no WRITEUP.md
DATE_NOW=$(date +%Y-%m-%d)
sed -i "s/\[NOME_DA_MAQUINA\]/${CHALLENGE_NAME}/g" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "s/\[NOME_DO_DESAFIO\]/${CHALLENGE_NAME}/g" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "s/\[DATA_ATUAL\]/${DATE_NOW}/g" "${CHALLENGE_DIR}/WRITEUP.md"

# Remove placeholders específicos de máquina, se existirem
sed -i "/^\[NOME_DA_MAQUINA_1\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[IP_DA_MAQUINA_1\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[DIFICULDADE_DA_MAQUINA_1\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[SINOPSE_DA_MAQUINA_1\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[NOME_DA_MAQUINA_2\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[IP_DA_MAQUINA_2\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[DIFICULDADE_DA_MAQUINA_2\]/d" "${CHALLENGE_DIR}/WRITEUP.md"
sed -i "/^\[SINOPSE_DA_MAQUINA_2\]/d" "${CHALLENGE_DIR}/WRITEUP.md"

echo "Estrutura do desafio '${CHALLENGE_NAME}' criada em '${CHALLENGE_DIR}'."
