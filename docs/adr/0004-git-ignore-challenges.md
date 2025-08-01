# 0004 - Ignorando Diretórios de Desafios no Git

## Status
Aceito

## Contexto
O diretório `challenges/` continha arquivos específicos de desafios que não deveriam ser versionados para manter a natureza genérica do repositório.

## Decisão
Atualizado o arquivo `.gitignore` para ignorar todo o conteúdo dentro de `challenges/`, exceto o arquivo `.gitkeep`. Isso garante que a estrutura do diretório seja mantida no repositório, permitindo que arquivos específicos de desafios permaneçam sem rastreamento.

## Consequências
- Impede o versionamento acidental de arquivos sensíveis ou específicos de desafios.
- Mantém um repositório limpo e genérico para o kit de ferramentas.
- Garante que a estrutura do diretório `challenges/` esteja presente para novos usuários.