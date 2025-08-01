# Diretrizes para a Colaboração com o Gemini

Este arquivo contém diretrizes e contexto para o Gemini sobre este projeto específico, visando otimizar a colaboração e a eficiência.

## Diretrizes Gerais

*   **Commits Atômicos:** Após cada marco significativo ou conclusão de uma tarefa, um commit deve ser criado para registrar o progresso. As mensagens de commit devem ser claras e descritivas, seguindo a convenção Conventional Commits (ex: `feat:`, `fix:`, `refactor:`, `chore:`).
*   **Autodocumentação:** O repositório deve ser estruturado para ser o mais autodocumentado possível, utilizando commits, changelogs e, eventualmente, release notes para registrar a evolução do projeto.
*   **Prioridade de Ferramentas:** Sempre que possível, utilize os scripts e ferramentas existentes no repositório para realizar tarefas (ex: `bin/create_challenge.sh`, `tools/nmap_scan.sh`).

## Estrutura do Projeto

O repositório segue uma estrutura organizada para facilitar o gerenciamento de múltiplos desafios e ferramentas:

*   `.devcontainer/`: Configurações para o ambiente de desenvolvimento do VS Code (Dev Container).
*   `bin/`: Contém scripts de gerenciamento do repositório e automação de fluxo de trabalho (ex: `create_challenge.sh`).
*   `docker/`: Contém o `Dockerfile` para construir a imagem do ambiente e o `docker-compose.yml` para orquestração do ambiente Docker.
*   `vpn/`: Pasta para os arquivos de configuração `.ovpn` do Hack The Box. **Esta pasta é ignorada pelo Git.**
*   `challenges/`: Contém subpastas para cada desafio HTB resolvido. Cada subpasta deve conter seu próprio `WRITEUP.md` e artefatos específicos do desafio.
*   `templates/`: Contém templates para novos arquivos, como `WRITEUP_TEMPLATE.md`.
*   `tools/`: Contém scripts utilitários de pentest (ex: `nmap_scan.sh`).
*   `.env.example`: Exemplo de arquivo de ambiente para configurar variáveis como `OVPN_CONFIG_FILE`.
*   `.gitignore`: Define arquivos e pastas a serem ignorados pelo controle de versão.
*   `GEMINI.md`: Este arquivo, contendo diretrizes para o Gemini.
*   `README.md`: Introdução geral ao repositório e instruções de uso para desenvolvedores.

## Ambiente de Desenvolvimento

O ambiente de desenvolvimento é isolado e consistente, configurado via Docker. Ele inclui ferramentas essenciais como `nmap` e `openvpn`.

*   **Inicialização da VPN:** A conexão VPN é iniciada automaticamente ao subir o contêiner. O script `start_vpn.sh` (localizado em `docker/`) gerencia a seleção do arquivo `.ovpn` (priorizando `OVPN_CONFIG_FILE` do `.env` ou o único arquivo na pasta `vpn/`).
*   **Acesso:** Pode ser acessado via VS Code Dev Containers ou diretamente via Docker Compose.

## Fluxo de Trabalho Comum

*   **Criação de Novo Desafio:** Utilize o script `bin/create_challenge.sh <nome_do_desafio>` para gerar a estrutura básica de um novo desafio em `challenges/<nome_do_desafio>/`.
*   **Execução de Scans:** Utilize o script `tools/nmap_scan.sh <IP_ADDRESS>` para realizar varreduras Nmap.

## Convenções

*   **Mensagens de Commit:** Seguir a convenção Conventional Commits.
*   **Nomes de Arquivos/Pastas:** Usar `snake_case` para nomes de arquivos e pastas, e `kebab-case` para nomes de desafios (se aplicável).

Com estas informações, o Gemini terá um entendimento mais aprofundado do projeto e poderá auxiliar de forma mais eficiente.
