# 0013 - Introdução do Makefile para Simplificação de Comandos

## Status
Aceito

## Contexto
A execução de comandos Docker Compose e scripts utilitários frequentemente exigia comandos longos e repetitivos, especialmente para usuários de terminal.

## Decisão
Um `Makefile` foi criado na raiz do projeto com alvos para simplificar operações comuns:
- `make up`: Iniciar o ambiente Docker Compose.
- `make down`: Parar o ambiente Docker Compose.
- `make clean`: Parar e remover todos os recursos do Docker Compose.
- `make shell`: Acessar o shell do contêiner.
- `make vpn-global`: Conectar à VPN usando `global.ovpn`.
- `make vpn-challenge CHALLENGE=<nome_do_desafio>`: Conectar a uma VPN específica do desafio.
- `make nmap-scan IP=<ip_alvo> [OUTPUT_DIR=<diretorio_saida>]`: Executar uma varredura Nmap.

## Consequências
- Simplificou significativamente a experiência do desenvolvedor, tornando os comandos mais curtos e fáceis de lembrar.
- Forneceu uma interface centralizada e consistente para gerenciar o ambiente de desenvolvimento.
- Melhorou a usabilidade geral para desenvolvedores que priorizam o terminal.