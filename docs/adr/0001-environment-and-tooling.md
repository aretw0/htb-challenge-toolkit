# 0001 - Estrutura do Repositório e Ferramentas

## Status
Aceito

## Contexto
Era essencial estabelecer uma base organizada e eficiente para o projeto, definindo uma estrutura de diretórios clara, uma configuração Docker consistente e ferramentas que simplificassem o fluxo de trabalho de desenvolvimento tanto para usuários de terminal quanto de VS Code Dev Containers.

## Decisão
Foram tomadas as seguintes decisões para estruturar o ambiente:

1.  **Organização do Repositório:**
    *   `bin/`: Para scripts de gerenciamento do projeto (ex: `create_challenge.sh`).
    *   `tools/`: Para scripts de pentest (ex: `nmap_scan.sh`).
    *   `templates/`: Para modelos de arquivos, como `WRITEUP_TEMPLATE.md`.

2.  **Configuração do Ambiente Docker:**
    *   A montagem de volume foi corrigida em `docker-compose.yml` para mapear a raiz do projeto para `/workspace`.
    *   A execução de comandos `docker-compose` foi padronizada para ocorrer sempre a partir da raiz do projeto.

3.  **Introdução do Makefile:**
    *   Um `Makefile` foi adicionado para criar atalhos para comandos comuns (`make up`, `make shell`, `make nmap-scan`), simplificando a interação com o ambiente.

4.  **Esclarecimento da Experiência do Desenvolvedor:**
    *   A documentação foi atualizada para orientar os usuários sobre quando usar o `Makefile` (no terminal do host) versus executar scripts diretamente (dentro do Dev Container).

## Consequências
- Uma base de projeto clara, consistente e de fácil navegação.
- Melhoria na produtividade do desenvolvedor através da simplificação de comandos.
- Redução da confusão e otimização do fluxo de trabalho para diferentes ambientes de desenvolvimento.
