# 0014 - Esclarecimento da Experiência do Desenvolvedor (VS Code Dev Containers vs. Terminal)

## Status
Aceito

## Contexto
A introdução do `Makefile` poderia criar confusão para usuários de VS Code Dev Containers, pois muitos comandos `make` duplicam funcionalidades já disponíveis diretamente no terminal do contêiner.

## Decisão
Atualizados `README.md` e `GEMINI.md` para:
- Explicar que, dentro de um Dev Container, o usuário já está no shell do contêiner.
- Recomendar a execução direta de scripts (`/workspace/tools/connect_vpn.sh`, `/workspace/tools/nmap_scan.sh`) para maior eficiência quando dentro do contêiner.
- Reconhecer a utilidade contínua dos comandos `make` para o gerenciamento do ciclo de vida do contêiner (ex: `make down`, `make clean`) a partir do terminal do host.

## Consequências
- Forneceu orientação clara para usuários em diferentes ambientes de desenvolvimento.
- Otimizou o fluxo de trabalho para usuários de VS Code Dev Containers, promovendo a execução direta de scripts.
- Reduziu a potencial confusão e melhorou a experiência geral do usuário.