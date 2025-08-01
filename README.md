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
2.  **Conecte-se à VPN (Manual):**
    Após iniciar o ambiente, você precisará iniciar a conexão VPN manualmente dentro do contêiner. O script `connect_vpn.sh` está disponível para isso.
    -   **Conectar com `global.ovpn` (padrão):**
        ```bash
        docker exec -it docker_pentest-env_1 /workspace/tools/connect_vpn.sh
        ```
    -   **Conectar com um arquivo `.ovpn` específico:**
        ```bash
        docker exec -it docker_pentest-env_1 /workspace/tools/connect_vpn.sh challenges/seu_desafio/seu_desafio.ovpn
        ```
        Substitua `seu_desafio/seu_desafio.ovpn` pelo caminho real do seu arquivo `.ovpn` relativo à raiz do projeto.
    -   **Verificar a conexão:** Após executar o comando, você pode verificar os logs do contêiner para confirmar a conexão:
        ```bash
        docker-compose -f docker/docker-compose.yml logs pentest-env
        ```
3.  **Inicie o Ambiente de Desenvolvimento:**
    - **Para usuários VS Code:** Abra o projeto no VS Code. Ele deve detectar a configuração do Dev Container e perguntar se você deseja reabri-lo no contêiner. Confirme.
    - **Para usuários de Terminal (Docker Compose):**
        - **Iniciar o ambiente:** Na raiz do projeto, execute:
            ```bash
            docker-compose -f docker/docker-compose.yml up -d
            ```
            Isso construirá (se necessário) e iniciará o contêiner em segundo plano.
        - **Acessar o shell do contêiner:**
            ```bash
            docker exec -it docker_pentest-env_1 bash
            ```
        - **Parar o ambiente:** Para parar os serviços sem remover os contêineres:
            ```bash
            docker-compose -f docker/docker-compose.yml stop
            ```
        - **Parar e remover o ambiente (limpeza completa):** Para parar os serviços, remover os contêineres, redes e volumes anônimos (útil para um "recomeço limpo" ou após depuração):
            ```bash
            docker-compose -f docker/docker-compose.yml down --volumes --remove-orphans
            ```
4.  **Crie um Novo Desafio:**
    Use o script `bin/create_challenge.sh` para gerar a estrutura de pastas para um novo desafio:
    ```bash
    ./bin/create_challenge.sh <nome_do_desafio>
    ```
    Exemplo: `./bin/create_challenge.sh path_of_glory` (para um Path) ou `./bin/create_challenge.sh cap` (para uma máquina individual).
    Isso criará `challenges/<nome_do_desafio>/WRITEUP.md` e a pasta `challenges/<nome_do_desafio>/scans/`.
5.  **Execute Scans:**
    Após conectar a VPN, você pode executar scans Nmap. O script `nmap_scan.sh` salvará os resultados na pasta `scans/` na raiz do projeto por padrão, ou em uma pasta específica se você usar a opção `-o`.
    ```bash
    docker exec -it docker_pentest-env_1 /workspace/tools/nmap_scan.sh <IP_ADDRESS>
    ```
    Exemplo: `docker exec -it docker_pentest-env_1 /workspace/tools/nmap_scan.sh 10.10.10.245`
    
    Para salvar os resultados em uma pasta de desafio específica (ex: `challenges/cap/scans/`):
    ```bash
    docker exec -it docker_pentest-env_1 /workspace/tools/nmap_scan.sh -o challenges/cap/scans <IP_ADDRESS>
    ```

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