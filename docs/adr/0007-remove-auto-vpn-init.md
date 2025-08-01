# 0007 - Remoção da Inicialização Automática da VPN

## Status
Aceito

## Contexto
A inicialização automática da VPN no `postStartCommand` do Dev Container e no `command` do `docker-compose.yml` introduziu complexidade e dependências desnecessárias.

## Decisão
- Removido `command: /usr/local/bin/start_vpn.sh` de `docker/docker-compose.yml`.
- Removido `postStartCommand: /usr/local/bin/start_vpn.sh` de `.devcontainer/devcontainer.json`.
- O contêiner agora inicia com seu shell padrão, e a conexão VPN é iniciada manualmente pelo usuário.

## Consequências
- Simplificação da configuração do ambiente pela remoção de comportamentos implícitos.
- Concedeu aos desenvolvedores controle explícito sobre quando iniciar a conexão VPN.
- Redução de potenciais problemas relacionados a falhas na inicialização da VPN durante a inicialização do ambiente.