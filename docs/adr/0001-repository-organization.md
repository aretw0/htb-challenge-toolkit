# 0001 - Organização e Estrutura do Repositório

## Status
Aceito

## Contexto
A estrutura inicial do repositório precisava de uma organização clara para scripts e documentação, a fim de suportar um kit de ferramentas genérico para desafios Hack The Box.

## Decisão
- **Diretórios de Scripts:**
    - Criado `bin/` para scripts de gerenciamento do repositório (ex: `create_challenge.sh`).
    - Criado `tools/` para scripts utilitários de pentest (ex: `nmap_scan.sh`).
- **Modelos (Templates):**
    - Criado `templates/` e `templates/WRITEUP_TEMPLATE.md` para padronizar a documentação de desafios.
- **Automação da Criação de Desafios:**
    - Desenvolvido `bin/create_challenge.sh` para automatizar a criação de novas estruturas de pastas de desafios, incluindo a cópia de `WRITEUP_TEMPLATE.md`.
- **Integração com VS Code:**
    - Configurado `.vscode/tasks.json` para permitir que `create_challenge.sh` seja executado diretamente do VS Code.

## Consequências
- Melhoria na clareza e separação de responsabilidades para diferentes tipos de scripts.
- Documentação padronizada para desafios.
- Processo simplificado de configuração de novos desafios.
- Experiência do desenvolvedor aprimorada para usuários do VS Code.