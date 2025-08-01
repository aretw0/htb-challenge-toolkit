# 0005 - Padronização de Diagramas Mermaid

## Status
Aceito

## Contexto
O projeto utiliza diagramas Mermaid para visualização de arquitetura, mas a falta de diretrizes claras sobre a sintaxe poderia levar a inconsistências e erros de renderização. Era necessário padronizar o uso do Mermaid para garantir diagramas claros e de fácil manutenção.

## Decisão
- Foram estabelecidas diretrizes de sintaxe para os diagramas Mermaid, cobrindo convenções de nomenclatura de nós, uso de IDs, rótulos, conectores e estilização específica para os tipos de diagramas usados (`architecture-beta` e `graph TD`).
- Essas diretrizes foram documentadas e incorporadas nas instruções para assistentes de IA (`GEMINI.md`, `copilot-instructions.md`) para garantir a geração de código consistente.

## Consequências
- **Consistência Visual:** Todos os diagramas no projeto seguem um estilo e sintaxe uniformes.
- **Manutenção Facilitada:** A padronização torna mais fácil para qualquer contribuidor entender e atualizar os diagramas.
- **Redução de Erros:** A probabilidade de erros de renderização do Mermaid é significativamente reduzida.
