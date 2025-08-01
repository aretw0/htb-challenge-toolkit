# 0011 - Abandono e Exclusão de .env.example

## Status
Aceito

## Contexto
O arquivo `.env.example` anteriormente continha variáveis de ambiente relacionadas à VPN que não são mais usadas para inicialização automática. Com a mudança para controle explícito e execução direta de scripts, este arquivo tornou-se redundante e pode causar confusão.

## Decisão
Para simplificar o projeto e evitar configurações desnecessárias, o arquivo `.env.example` será completamente abandonado e excluído do repositório.

## Consequências
- Simplifica ainda mais a configuração do projeto, removendo um arquivo redundante.
- Elimina a potencial confusão para os usuários em relação a variáveis de ambiente não utilizadas ou desatualizadas.
- Reforça a filosofia de controle explícito, onde os usuários gerenciam diretamente sua configuração VPN e outras configurações específicas do ambiente conforme necessário.