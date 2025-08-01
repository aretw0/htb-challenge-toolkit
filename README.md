# HTB-Challenge-Toolkit

Bem-vindo ao **HTB-Challenge-Toolkit**! Este repositório foi criado para ser sua caixa de ferramentas e diário de bordo no enfrentamento de desafios da plataforma Hack The Box (HTB).

## Propósito

Nosso objetivo é fornecer um ambiente de desenvolvimento consistente e portátil, juntamente com scripts utilitários e uma estrutura de documentação para cada máquina HTB que você resolver. Embora tenhamos começado com o desafio "Cap", este repositório é projetado para ser uma solução de longo prazo para suas jornadas de pentest.

## Funcionalidades Principais

*   **Ambiente de Desenvolvimento Isolado:** Utilize Dev Containers (para usuários VS Code) ou Docker Compose (para usuários de terminal) para um ambiente de pentest pré-configurado com ferramentas essenciais como `nmap` e `openvpn`.
*   **Conexão VPN Automatizada:** Configure sua conexão VPN do HTB para iniciar automaticamente ao subir o ambiente, com validação e feedback claros.
*   **Scripts Utilitários:** Ferramentas automatizadas para tarefas comuns de reconhecimento e enumeração.
*   **Documentação Estruturada:** Um modelo de `WRITEUP.md` para cada máquina, permitindo que você registre seu processo de resolução, desde o reconhecimento até a escalada de privilégios.
*   **Histórico de Commits Significativo:** Adotamos uma abordagem de commits atômicos para que o histórico do Git reflita o progresso e as decisões tomadas.

## Como Começar

1.  **Clone o Repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd <nome_do_repositorio>
    ```
2.  **Configure sua VPN:**
    *   Crie uma pasta `vpn/` na raiz do projeto.
    *   Coloque seu arquivo `.ovpn` do Hack The Box dentro desta pasta (ex: `vpn/meu_arquivo.ovpn`).
    *   Se você tiver múltiplos arquivos `.ovpn` ou quiser especificar qual usar, crie um arquivo `.env` na raiz do projeto (copiando de `.env.example`) e defina `OVPN_CONFIG_FILE=nome_do_seu_arquivo.ovpn`.
3.  **Inicie o Ambiente de Desenvolvimento:**
    *   **Para usuários VS Code:** Abra o projeto no VS Code. Ele deve detectar a configuração do Dev Container e perguntar se você deseja reabri-lo no contêiner. Confirme.
    *   **Para usuários de Terminal (Docker Compose):** Navegue até a pasta `docker/` e execute `docker-compose up -d`. Para entrar no shell do contêiner, use `docker-compose exec pentest-env bash`.

## Estrutura do Projeto

*   `.devcontainer/`: Configurações para o Dev Container do VS Code.
*   `docker/`: Contém o `Dockerfile` e o `docker-compose.yml` para o ambiente Docker.
*   `vpn/`: Pasta para seus arquivos de configuração `.ovpn` (ignorada pelo Git).
*   `nmap_scan.sh`: Script utilitário para varredura Nmap.
*   `GEMINI.md`: Diretrizes de colaboração para o Gemini (este assistente).
*   `WRITEUP.md`: Modelo de documentação para cada desafio HTB.

## Contribuição

Sinta-se à vontade para contribuir com scripts, melhorias no ambiente ou sugestões para aprimorar esta caixa de ferramentas!