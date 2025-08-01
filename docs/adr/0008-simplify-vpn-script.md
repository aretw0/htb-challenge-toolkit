# 0008 - Simplificação do Script de Conexão VPN

## Status
Aceito

## Contexto
O script `start_vpn.sh` estava sobrecarregado com a lógica de prioridade de arquivos `.ovpn` e dependências de variáveis de ambiente.

## Decisão
- Renomeado `docker/start_vpn.sh` para `tools/connect_vpn.sh`.
- Simplificada a lógica de `connect_vpn.sh`: agora aceita o caminho do arquivo `.ovpn` como argumento. Se nenhum argumento for fornecido, ele assume `/workspace/global.ovpn` por padrão.
- O script agora é executado manualmente pelo usuário dentro do contêiner (`docker exec -it <container_id> /workspace/tools/connect_vpn.sh [caminho/do/ovpn]`).

## Consequências
- Script de conexão VPN mais limpo e focado.
- Controle explícito sobre qual arquivo `.ovpn` usar.
- Redução da complexidade na configuração geral do ambiente.