# Diretrizes para a Colaboração com o Gemini

Este arquivo contém diretrizes e contexto essenciais para o Gemini sobre este projeto, visando otimizar a colaboração.

## Diretrizes Operacionais

*   **Commits Atômicos:** Registrar progresso com commits claros e descritivos, seguindo a convenção Conventional Commits (ex: `feat:`, `fix:`, `refactor:`, `chore:`).
*   **Autodocumentação:** Manter o repositório autodocumentado através de commits e estrutura de arquivos.
*   **Prioridade de Ferramentas:** Sempre que possível, utilize os scripts e ferramentas existentes no repositório para realizar tarefas.

## Estrutura do Projeto

Compreensão da organização do repositório para localização de arquivos e contexto:

*   `.devcontainer/`: Configurações do Dev Container (VS Code).
*   `bin/`: Scripts de gerenciamento do repositório (ex: `create_challenge.sh`).
*   `docker/`: `Dockerfile` e `docker-compose.yml` para o ambiente Docker.
*   `vpn/`: Arquivos `.ovpn` (ignorados pelo Git).
*   `challenges/`: Pastas para cada desafio HTB, contendo `WRITEUP.md` e artefatos.
*   `templates/`: Templates para novos arquivos (ex: `WRITEUP_TEMPLATE.md`).
*   `tools/`: Scripts utilitários de pentest (ex: `nmap_scan.sh`).
*   `.env.example`: Exemplo de configuração de variáveis de ambiente.

## Ambiente de Desenvolvimento

O ambiente é isolado via Docker, incluindo `nmap` e `openvpn`. A conexão VPN é iniciada automaticamente ao subir o contêiner, gerenciada pelo script `docker/start_vpn.sh`.

## Fluxo de Trabalho Comum

*   **Criação de Desafio:** `bin/create_challenge.sh <nome_do_desafio>`
*   **Execução de Scans:** `tools/nmap_scan.sh <IP_ADDRESS>`

## Convenções

*   **Mensagens de Commit:** Seguir Conventional Commits.
*   **Nomes:** `snake_case` para arquivos/pastas, `kebab-case` para nomes de desafios.