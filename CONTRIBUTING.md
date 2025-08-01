# Guia de Contribuição

Ficamos felizes com o seu interesse em contribuir para o HTB Challenge Toolkit! Este documento fornece diretrizes para garantir que as contribuições sejam consistentes e de alta qualidade.

## Como Contribuir

- **Issues:** Use as Issues do GitHub para relatar bugs, sugerir novos recursos ou iniciar discussões sobre melhorias.
- **Pull Requests:** Para alterações de código, por favor, abra um Pull Request. Certifique-se de que seu PR esteja bem documentado e siga as convenções abaixo.

## Convenções

### Mensagens de Commit

Siga a convenção [Conventional Commits](https://www.conventionalcommits.org/). Cada mensagem de commit deve ter um prefixo que descreva o tipo de alteração:

- `feat:`: Uma nova funcionalidade.
- `fix:`: Uma correção de bug.
- `docs:`: Alterações apenas na documentação.
- `style:`: Alterações que não afetam o significado do código (espaços em branco, formatação, etc.).
- `refactor:`: Uma alteração de código que não corrige um bug nem adiciona uma funcionalidade.
- `test:`: Adicionando testes ou corrigindo testes existentes.
- `chore:`: Alterações no processo de build ou em ferramentas auxiliares e bibliotecas.

### Estilo de Código

- **Shell Scripts:** Siga as melhores práticas gerais de scripting em Bash. Mantenha os scripts legíveis e bem comentados quando a lógica for complexa.
- **Nomenclatura:** Use `snake_case` para nomes de arquivos e diretórios e `kebab-case` para nomes de desafios.

## Padrões de Documentação

Manter a documentação clara e consistente é fundamental para este projeto.

### Architectural Decision Records (ADRs)

Decisões de arquitetura significativas são documentadas em `docs/adr/`. Se sua contribuição introduz uma mudança de arquitetura, por favor, discuta a necessidade de um novo ADR.

### Diagramas Mermaid

Utilizamos diagramas Mermaid para ilustrar a arquitetura e os fluxos de trabalho. Para garantir a consistência, padronizamos a sintaxe e o estilo dos diagramas.

**--> Para detalhes completos, consulte o ADR: [0015 - Padronização de Diagramas Mermaid](./docs/adr/0015-standardize-mermaid-diagrams.md)**

As diretrizes estão também refletidas nos arquivos de contexto para assistentes de IA (`GEMINI.md` e `.github/copilot-instructions.md`) para garantir que o código gerado por eles siga os mesmos padrões.
