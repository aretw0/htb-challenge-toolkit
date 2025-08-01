# 0006 - Correção da Montagem de Volume do Docker Compose

## Status
Aceito

## Contexto
Durante os testes do ambiente de terminal, foi identificado que `global.ovpn` não estava sendo encontrado dentro do contêiner, apesar de estar presente na raiz do projeto no host. A depuração revelou que a montagem de volume em `docker-compose.yml` (`- .:/workspace:cached`) estava montando a própria pasta `docker/` para `/workspace` dentro do contêiner, em vez da raiz do projeto. Além disso, a diretiva `env_file: .env` em `docker-compose.yml` estava causando problemas ao procurar o `.env` no diretório `docker/` em vez da raiz do projeto.

## Decisão
- Alterada a montagem de volume em `docker/docker-compose.yml` de `- .:/workspace:cached` para `- ..:/workspace:cached`, garantindo que a raiz do projeto seja montada corretamente em `/workspace`.
- Removida a linha `env_file: .env` de `docker/docker-compose.yml`, permitindo que o Docker Compose use seu comportamento padrão de procurar o `.env` no diretório de execução (raiz do projeto).
- A verificação manual dentro do contêiner (`docker exec -it <container_id> bash` e `ls -l /workspace`) foi realizada para confirmar a presença dos arquivos esperados.

## Consequências
- Acesso correto aos arquivos dentro do contêiner, tornando todos os arquivos do projeto acessíveis em `/workspace`.
- Carregamento simplificado de variáveis de ambiente, contando com o tratamento padrão de `.env` do Docker Compose.
- Comportamento consistente garantido em diferentes ambientes de desenvolvimento.