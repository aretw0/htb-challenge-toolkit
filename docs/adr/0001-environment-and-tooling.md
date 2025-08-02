# 0001 - Organização do Repositório, Ferramentas e Configuração do Ambiente

## Status
Aceito

## Contexto
Era essencial estabelecer uma base organizada e eficiente para o projeto, definindo uma estrutura de diretórios clara, uma configuração Docker consistente e ferramentas que simplificassem o fluxo de trabalho de desenvolvimento tanto para usuários de terminal quanto de VS Code Dev Containers. A introdução de novas funcionalidades, como o servidor MCP, exigiu a revisão e integração de novas configurações.

## Decisão
Foram tomadas as seguintes decisões para estruturar e configurar o ambiente:

1.  **Organização do Repositório:**
    *   `bin/`: Para scripts de gerenciamento do projeto (ex: `create_challenge.sh`).
    *   `tools/`: Para scripts de pentest (ex: `nmap_scan.sh`).
    *   `templates/`: Para modelos de arquivos, como `WRITEUP_TEMPLATE.md`.

2.  **Configuração do Ambiente Docker:**
    *   A montagem de volume foi corrigida em `docker-compose.yml` para mapear a raiz do projeto para `/workspace`.
    *   A execução de comandos `docker-compose` foi padronizada para ocorrer sempre a partir da raiz do projeto.
    *   **Integração do Servidor MCP:** Adicionado o serviço `github-mcp-server` ao `docker-compose.yml` para suportar cenários de Model Context Protocol.

3.  **Introdução do Makefile:**
    *   Um `Makefile` foi adicionado para criar atalhos para comandos comuns (`make up`, `make shell`, `make nmap-scan`).
    *   **Gerenciamento do Servidor MCP via Makefile:** Adicionados os alvos `make mcp-up` e `make mcp-down` para simplificar o gerenciamento do servidor MCP.

4.  **Gerenciamento de Configurações e Variáveis de Ambiente:**
    *   **Reintrodução de `.env.example`:** O arquivo `.env.example` foi reintroduzido para servir como um modelo para variáveis de ambiente, especificamente para o `GITHUB_PERSONAL_ACCESS_TOKEN` exigido pelo servidor MCP. Os usuários serão instruídos a copiar `.env.example` para `.env` e preencher o token.
    *   **Rastreamento de `.vscode/mcp.json`:** O arquivo `.vscode/mcp.json` será rastreado no controle de versão para garantir que todos os desenvolvedores que usam o VS Code com este repositório tenham a configuração necessária do servidor MCP automaticamente disponível.

5.  **Esclarecimento da Experiência do Desenvolvedor:**
    *   A documentação foi atualizada para orientar os usuários sobre quando usar o `Makefile` (no terminal do host) versus executar scripts diretamente (dentro do Dev Container).

## Consequências
- Uma base de projeto clara, consistente e de fácil navegação.
- Melhoria na produtividade do desenvolvedor através da simplificação de comandos.
- Redução da confusão e otimização do fluxo de trabalho para diferentes ambientes de desenvolvimento.
- Suporte integrado para o servidor MCP, facilitando o desenvolvimento de funcionalidades relacionadas a IA e GitHub.
- Configuração de ambiente mais robusta e padronizada para usuários de VS Code.