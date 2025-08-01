# 0005 - Configuração VPN Simplificada e Flexível

## Status
Aceito

## Contexto
A configuração VPN anterior exigia a definição manual de variáveis de ambiente, o que não era ideal para diferentes ambientes de desenvolvimento (terminal vs. VS Code Dev Containers).

## Decisão
- Refatorado o script `docker/start_vpn.sh` (agora `tools/connect_vpn.sh`) para implementar uma cadeia de prioridade para a busca de arquivos `.ovpn`:
    1.  Caminho explícito via argumento (maior prioridade).
    2.  `challenges/<CHALLENGE_NAME>/<CHALLENGE_NAME>.ovpn` (se `CHALLENGE_NAME` for fornecido).
    3.  `/workspace/global.ovpn` (fallback).
- Removida a configuração explícita de `OVPN_CONFIG_FILE` de `.devcontainer/devcontainer.json`, confiando na leitura automática de `.env` pelo Dev Container.
- Atualizados `README.md`, `GEMINI.md` e `.env.example` para documentar claramente a nova cadeia de prioridade e os métodos para definir `OVPN_CONFIG_FILE` e `CHALLENGE_NAME` (via `.env` ou linha de comando).

## Consequências
- Configuração VPN mais flexível e amigável ao usuário.
- Redução das etapas de configuração manual para diferentes ambientes.
- Documentação mais clara sobre as opções de conexão VPN.