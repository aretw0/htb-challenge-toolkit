# HTB-Challenge-Toolkit

Bem-vindo ao **HTB-Challenge-Toolkit**! Este repositório foi criado para ser sua caixa de ferramentas e diário de bordo no enfrentamento de desafios da plataforma Hack The Box (HTB).

## Propósito

Nosso objetivo é fornecer um ambiente de desenvolvimento consistente e portátil, juntamente com scripts utilitários e uma estrutura de documentação para cada **desafio** da plataforma Hack The Box que você resolver. Embora tenhamos começado com o **desafio** "Cap", este repositório é projetado para ser uma solução de longo prazo para suas jornadas de pentest.

## Funcionalidades Principais

- **Ambiente de Desenvolvimento Isolado:** Utilize Dev Containers (para usuários VS Code) ou Docker Compose (para usuários de terminal) para um ambiente de pentest pré-configurado com ferramentas essenciais como `nmap` e `openvpn`.
- **Conexão VPN Automatizada:** Configure sua conexão VPN do HTB para iniciar automaticamente ao subir o ambiente, com validação e feedback claros.
- **Scripts Utilitários:** Ferramentas automatizadas para tarefas comuns de reconhecimento e enumeração, com resultados de scans salvos automaticamente na pasta `scans/` de cada desafio.
- **Documentação Estruturada:** Um modelo de `WRITEUP.md` para cada **desafio**, permitindo que você registre seu processo de resolução, desde o reconhecimento até a escalada de privilégios.
- **Histórico de Commits Significativo:** Adotamos uma abordagem de commits atômicos para que o histórico do Git reflita o progresso e as decisões tomadas.

## Como Começar

1.  **Clone o Repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd <nome_do_repositorio>
    ```
2.  **Configure sua VPN:**
    O ambiente tentará automaticamente encontrar e usar seu arquivo `.ovpn` na seguinte ordem de prioridade:
    -   **Para um desafio específico:** Se a variável de ambiente `CHALLENGE_NAME` estiver definida (ex: `CHALLENGE_NAME=cap`), o ambiente procurará por `challenges/<CHALLENGE_NAME>/<CHALLENGE_NAME>.ovpn`. Certifique-se de que o arquivo `.ovpn` tenha o mesmo nome da pasta do desafio.
        -   **Como definir `CHALLENGE_NAME`:**
            -   **Para usuários de Terminal (Docker Compose):** Você pode definir a variável diretamente na linha de comando (ex: `CHALLENGE_NAME=cap docker-compose up -d`) ou, para persistência, criar um arquivo `.env` na raiz do projeto (copiando de `.env.example`) e adicionar `CHALLENGE_NAME=seu_desafio`.
            -   **Para usuários VS Code (Dev Containers):** Crie um arquivo `.env` na raiz do projeto (copiando de `.env.example`) e adicione `CHALLENGE_NAME=seu_desafio`. O Dev Container lerá automaticamente esta variável.
    -   **Para uma VPN global (fallback):** Se `CHALLENGE_NAME` não estiver definido ou o arquivo `.ovpn` do desafio não for encontrado, o ambiente procurará por `global.ovpn` na raiz do repositório.
    -   **Erro:** Se nenhum dos arquivos `.ovpn` for encontrado nos locais esperados, a conexão VPN não será iniciada e o contêiner pode falhar ao iniciar ou exibir um erro.
3.  **Inicie o Ambiente de Desenvolvimento:**
    - **Para usuários VS Code:** Abra o projeto no VS Code. Ele deve detectar a configuração do Dev Container e perguntar se você deseja reabri-lo no contêiner. Confirme.
    - **Para usuários de Terminal (Docker Compose):** Navegue até a pasta `docker/` e execute `docker-compose up -d`. Para entrar no shell do contêiner, use `docker-compose exec pentest-env bash`.
4.  **Crie um Novo Desafio:**
    Use o script `bin/create_challenge.sh` para gerar a estrutura de pastas para um novo desafio:
    ```bash
    ./bin/create_challenge.sh <nome_do_desafio>
    ```
    Exemplo: `./bin/create_challenge.sh path_of_glory` (para um Path) ou `./bin/create_challenge.sh cap` (para uma máquina individual).
    Isso criará `challenges/<nome_do_desafio>/WRITEUP.md` e a pasta `challenges/<nome_do_desafio>/scans/`.
5.  **Execute Scans:**
    Navegue até o diretório do desafio (ex: `cd challenges/cap/`) e execute o script de scan:
    ```bash
    ../../tools/nmap_scan.sh <IP_ADDRESS>
    ```
    Os resultados serão salvos automaticamente na pasta `scans/` dentro do diretório do desafio.

## Estrutura do Projeto

- `.devcontainer/`: Configurações para o Dev Container do VS Code.
- `bin/`: Contém scripts para gerenciar o repositório (ex: `create_challenge.sh`).
- `docker/`: Contém o `Dockerfile` e o `docker-compose.yml` para o ambiente Docker.
- `challenges/`: Contém as pastas para cada desafio HTB, cada uma com seu `WRITEUP.md` e artefatos específicos. Cada pasta de desafio também contém uma subpasta `scans/` para os resultados dos scans.
- `templates/`: Contém templates para novos desafios (ex: `WRITEUP_TEMPLATE.md`).
- `tools/`: Contém scripts utilitários de pentest (ex: `nmap_scan.sh`).
- `GEMINI.md`: Diretrizes de colaboração para o Gemini (este assistente).
- `README.md`: Este arquivo.

## Contribuição

Sinta-se à vontade para contribuir com scripts, melhorias no ambiente ou sugestões para aprimorar esta caixa de ferramentas!