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

2.  **Reintrodução de `.env.example`:**
    *   O arquivo `.env.example` foi reintroduzido para servir como um modelo para variáveis de ambiente, especificamente para o `GITHUB_PERSONAL_ACCESS_TOKEN` que será usado na configuração do servidor MCP. Isso garante que os usuários tenham um guia claro para configurar o ambiente para funcionalidades como o MCP.

## Consequências
- **Repositório Limpo:** O projeto permanece um kit de ferramentas genérico, livre de dados específicos do usuário.
- **Segurança:** Reduz o risco de expor acidentalmente informações sensíveis de um desafio.
- **Configuração Simplificada:** A remoção de arquivos de configuração obsoletos torna o projeto mais fácil de entender para novos usuários.
