# 0012 - Padronização da Execução do Docker Compose

## Status
Aceito

## Contexto
A documentação anterior sugeria a execução do `docker-compose` a partir de subdiretórios, o que poderia levar a inconsistências e confusão em relação ao contexto.

## Decisão
A documentação agora enfatiza explicitamente que os comandos `docker-compose` devem ser sempre executados a partir do diretório raiz do projeto.

## Consequências
- Garante comportamento e contexto consistentes para todas as operações do Docker Compose.
- Simplifica as instruções do usuário e reduz potenciais erros.
- Alinha-se com as melhores práticas comuns para projetos Docker Compose.