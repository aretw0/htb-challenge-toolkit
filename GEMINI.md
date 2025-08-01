# Diretrizes para a Colaboração com o Gemini

Este arquivo contém diretrizes e contexto essenciais para o Gemini sobre este projeto, visando otimizar a colaboração.

## Diretrizes Operacionais

*   **Commits Atômicos:** Registrar progresso com commits claros e descritivos, seguindo a convenção Conventional Commits (ex: `feat:`, `fix:`, `refactor:`, `chore:`).
*   **Autodocumentação:** Manter o repositório autodocumentado através de commits e estrutura de arquivos.
*   **Neutralidade de Ambiente:** Evitar a inclusão de informações específicas do ambiente local do desenvolvedor (nomes de usuário, caminhos absolutos, etc.) em arquivos versionados. Exceções são exemplos genéricos em documentação (ex: `/foo/bar`).
*   **Prioridade de Ferramentas:** Sempre que possível, utilize os scripts e ferramentas existentes no repositório para realizar tarefas.

## Estrutura do Projeto

Compreensão da organização do repositório para localização de arquivos e contexto:

*   `.devcontainer/`: Configurações do Dev Container (VS Code).
*   `bin/`: Scripts de gerenciamento do repositório (ex: `create_challenge.sh`).
*   `docker/`: `Dockerfile` e `docker-compose.yml` para o ambiente Docker.
*   `challenges/`: Pastas para cada desafio HTB, contendo `WRITEUP.md` e artefatos. Cada pasta de desafio também contém uma subpasta `scans/` para os resultados dos scans.
*   `templates/`: Templates para novos arquivos (ex: `WRITEUP_TEMPLATE.md`).
*   `tools/`: Contém scripts utilitários de pentest (ex: `nmap_scan.sh`). Os resultados dos scans são salvos automaticamente na pasta `scans/` do desafio atual.
*   `.env.example`: Exemplo de configuração de variáveis de ambiente.

## Ambiente de Desenvolvimento

O ambiente é isolado via Docker, incluindo `nmap` e `openvpn`. A conexão VPN é iniciada automaticamente ao subir o contêiner, gerenciada pelo script `docker/start_vpn.sh`. A configuração da VPN segue a ordem de prioridade: `OVPN_CONFIG_FILE` (se definido), depois arquivos específicos do desafio (definidos via `CHALLENGE_NAME` em um arquivo `.env` na raiz do projeto), e por fim um `global.ovpn` na raiz do projeto.

**Detalhes da Configuração Docker Compose:**
- O `docker-compose.yml` monta a raiz do projeto (`..`) para `/workspace` dentro do contêiner, garantindo que todos os arquivos do projeto estejam acessíveis.
- O Docker Compose automaticamente carrega variáveis de ambiente de um arquivo `.env` localizado na raiz do projeto (diretório de execução do `docker-compose`), sem a necessidade de uma diretiva `env_file` explícita no `docker-compose.yml`.

## Fluxo de Trabalho Comum

*   **Criação de Desafio:** `bin/create_challenge.sh <nome_do_desafio>` (Isso criará `challenges/<nome_do_desafio>/WRITEUP.md` e a pasta `challenges/<nome_do_desafio>/scans/`. O nome do desafio pode ser o nome de uma máquina individual ou de um Path/Desafio com múltiplas máquinas.)
*   **Execução de Scans:** Navegue até o diretório do desafio (ex: `cd challenges/cap/`) e execute o script de scan: `../../tools/nmap_scan.sh <IP_ADDRESS>`. Os resultados serão salvos automaticamente na pasta `scans/` dentro do diretório do desafio.

## Convenções

*   **Mensagens de Commit:** Seguir Conventional Commits.
*   **Nomes:** `snake_case` para arquivos/pastas, `kebab-case` para nomes de desafios.
