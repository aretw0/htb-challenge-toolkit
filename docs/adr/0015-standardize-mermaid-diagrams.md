# 0015 - Padronização de Diagramas Mermaid

## Status

Aceito

## Contexto

O projeto utiliza diagramas Mermaid para visualização de arquitetura, mas não havia diretrizes claras sobre a sintaxe a ser utilizada. Isso poderia levar a diagramas inconsistentes, difíceis de manter e com possíveis erros de renderização, especialmente com os diferentes "sabores" de Mermaid, como `architecture-beta` e `graph TD`.

## Decisão

- Padronizar as diretrizes de sintaxe para os diagramas Mermaid usados no projeto.
- As diretrizes devem cobrir os tipos de diagramas existentes (`architecture-beta` e `graph TD`), incluindo convenções de nomenclatura de nós, uso de IDs, rótulos, conectores, subgrafos e estilização específica (ícones para `architecture-beta` e a diretiva `style` para `graph`).
- Documentar essas diretrizes em um local centralizado para fácil consulta por contribuidores humanos.
- Atualizar os arquivos de instruções para assistentes de IA (`GEMINI.md`, `copilot-instructions.md`) para refletir essas diretrizes e garantir a geração de código consistente.

## Consequências

### Positivas

- Garante consistência visual e de sintaxe em todos os diagramas do projeto.
- Facilita a manutenção e a atualização dos diagramas.
- Reduz a probabilidade de erros de renderização do Mermaid.
- Fornece uma referência clara para todos os contribuidores (humanos e IA), melhorando a qualidade da documentação.

### Negativas

- Nenhuma consequência negativa identificada.
