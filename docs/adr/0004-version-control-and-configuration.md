# 0004 - Controle de Versão e Configuração

## Status
Aceito

## Contexto
Para manter o repositório genérico e limpo, era necessário definir políticas claras sobre quais arquivos deveriam ser versionados. Além disso, arquivos de configuração de exemplo que se tornaram obsoletos precisavam ser removidos para evitar confusão.

## Decisão
Foram tomadas as seguintes decisões de configuração e controle de versão:

1.  **Ignorando Diretórios de Desafios (`.gitignore`):**
    *   O arquivo `.gitignore` foi configurado para ignorar o conteúdo do diretório `challenges/`, exceto por um arquivo `.gitkeep`.
    *   Isso permite que os usuários trabalhem em seus desafios sem versionar acidentalmente arquivos específicos da máquina ou informações sensíveis.

2.  **Abandono do `.env.example`:**
    *   O arquivo `.env.example` foi removido do projeto, pois as variáveis de ambiente que ele continha não eram mais necessárias devido à mudança para um controle de VPN explícito.

## Consequências
- **Repositório Limpo:** O projeto permanece um kit de ferramentas genérico, livre de dados específicos do usuário.
- **Segurança:** Reduz o risco de expor acidentalmente informações sensíveis de um desafio.
- **Configuração Simplificada:** A remoção de arquivos de configuração obsoletos torna o projeto mais fácil de entender para novos usuários.
