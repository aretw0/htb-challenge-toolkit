# 0009 - Simplificação do Script de Varredura Nmap

## Status
Aceito

## Contexto
O script `nmap_scan.sh` tentava inferir o diretório de saída com base em `CHALLENGE_NAME`, adicionando complexidade desnecessária.

## Decisão
- Removida a lógica de detecção de `CHALLENGE_NAME` de `tools/nmap_scan.sh`.
- O `OUTPUT_DIR` agora assume `scans/` na raiz do projeto por padrão, ou pode ser explicitamente especificado com a opção `-o`.
- O script agora cria o diretório de saída (`scans/`) se ele não existir.

## Consequências
- Simplificação do script de varredura Nmap, tornando-o mais direto de usar.
- Comportamento padrão claro para a saída da varredura.
- Permitiu controle explícito sobre o local de saída quando necessário.