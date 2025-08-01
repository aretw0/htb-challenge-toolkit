# 0010 - Remoção da Criação Implícita de Arquivos

## Status
Aceito

## Contexto
O script `bin/create_challenge.sh` estava criando implicitamente um arquivo `.ovpn` de placeholder, o que ia contra a filosofia de controle explícito.

## Decisão
Removida a linha que criava o arquivo `.ovpn` de placeholder de `bin/create_challenge.sh`.

## Consequências
- Alinhado com a filosofia de controle explícito.
- Reduzida a criação desnecessária de arquivos durante a configuração do desafio.
- Os usuários agora são responsáveis por fornecer seus próprios arquivos `.ovpn` quando necessário.