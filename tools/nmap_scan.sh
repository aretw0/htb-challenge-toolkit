#!/bin/bash

# Wrapper para escaneamento Nmap em duas fases.
# Uso: ./nmap_scan.sh [-s] [-o <output_dir>] <IP_ADDRESS>

# Valores Padrão
SILENT=false
OUTPUT_DIR="scans"

# Função para exibir o modo de uso
print_usage() {
  echo "Uso: $0 [-s] [-o <output_dir>] <IP_ADDRESS>"
  echo "  -s: Modo silencioso. Não exibe o output na tela, apenas salva no arquivo."
  echo "  -o <output_dir>: Pasta para salvar o arquivo de resultados. O padrão é a pasta atual."
  exit 1
}

# Processa os parâmetros opcionais
while getopts "so:" opt; do
  case ${opt} in
    s)
      SILENT=true
      ;;
    o)
      OUTPUT_DIR=$OPTARG
      ;;
    \?)
      print_usage
      ;;
  esac
done
shift $((OPTIND -1))

# Verifica se o endereço IP foi fornecido
if [ -z "$1" ]; then
  echo "Erro: Nenhum endereço IP fornecido."
  print_usage
fi

IP_ADDRESS=$1

# Verifica se a pasta de saída existe
if [ ! -d "$OUTPUT_DIR" ]; then
  echo "Erro: A pasta de saída '$OUTPUT_DIR' não existe."
  exit 1
fi

# Gera o nome do arquivo de saída com timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)
OUTPUT_FILE="${OUTPUT_DIR}/nmap_results_${IP_ADDRESS//./-}_${TIMESTAMP}.txt"

if [ "$SILENT" = false ]; then
  echo "Iniciando varredura rápida de portas em $IP_ADDRESS..."
fi

# Fase 1: Varredura rápida para identificar todas as portas TCP abertas.
ports=$(nmap -p- --min-rate=1000 -Pn -T4 $IP_ADDRESS | grep '^[0-9]' | cut -d '/' -f 1 | tr '
' ',' | sed s/,$//)

# Verifica se alguma porta foi encontrada.
if [ -z "$ports" ]; then
  if [ "$SILENT" = false ]; then
    echo "Nenhuma porta aberta encontrada em $IP_ADDRESS."
  fi
  exit 0
fi

if [ "$SILENT" = false ]; then
  echo "Portas abertas encontradas: $ports"
  echo "Iniciando varredura detalhada de serviços..."
fi

# Fase 2: Varredura detalhada (scripts, versões) nas portas encontradas.
# Redireciona o stdout do nmap para /dev/null para controlar a saída do script
nmap -p$ports -Pn -sC -sV -oN "$OUTPUT_FILE" $IP_ADDRESS > /dev/null

if [ "$SILENT" = false ]; then
  echo "Varredura concluída. Resultados salvos em $OUTPUT_FILE"
  echo "----------------------------------------------------"
  cat "$OUTPUT_FILE"
else
  echo "Varredura concluída. Resultados salvos em $OUTPUT_FILE"
fi
