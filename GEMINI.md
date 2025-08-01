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

O ambiente é isolado via Docker, incluindo `nmap` e `openvpn`. A conexão VPN não é mais iniciada automaticamente ao subir o contêiner. Em vez disso, o desenvolvedor tem controle explícito sobre quando e como iniciar a conexão VPN, executando o script `connect_vpn.sh` manualmente dentro do contêiner.

**Detalhes da Configuração Docker Compose:**
- O `docker-compose.yml` monta a raiz do projeto (`..`) para `/workspace` dentro do contêiner, garantindo que todos os arquivos do projeto estejam acessíveis.
- O Docker Compose automaticamente carrega variáveis de ambiente de um arquivo `.env` localizado na raiz do projeto (diretório de execução do `docker-compose`), sem a necessidade de uma diretiva `env_file` explícita no `docker-compose.yml`.

## Fluxo de Trabalho Comum

*   **Criação de Desafio:** `bin/create_challenge.sh <nome_do_desafio>` (Isso criará `challenges/<nome_do_desafio>/WRITEUP.md` e a pasta `challenges/<nome_do_desafio>/scans/`. O nome do desafio pode ser o nome de uma máquina individual ou de um Path/Desafio com múltiplas máquinas.)
*   **Início do Ambiente:**
    ```bash
    make up
    ```
*   **Conexão VPN:**
    -   **Global:**
        ```bash
        make vpn-global
        ```
    -   **Desafio Específico:**
        ```bash
        make vpn-challenge CHALLENGE=<nome_do_desafio>
        ```
*   **Execução de Scans:**
    -   **Básico:**
        ```bash
        make nmap-scan IP=<IP_ADDRESS>
        ```
    -   **Com Diretório de Saída:**
        ```bash
        make nmap-scan IP=<IP_ADDRESS> OUTPUT_DIR=challenges/<nome_do_desafio>/scans
        ```
*   **Acessar Shell do Contêiner:**
    ```bash
    make shell
    ```
*   **Parar Ambiente:**
    ```bash
    make down
    ```
*   **Limpeza Completa do Ambiente:**
    ```bash
    make clean
    ```

## Convenções

*   **Mensagens de Commit:** Seguir Conventional Commits.
*   **Nomes:** `snake_case` para arquivos/pastas, `kebab-case` para nomes de desafios.
