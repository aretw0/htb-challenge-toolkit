# 0002 - Refinamento da Documentação e Convenções

## Status
Aceito

## Contexto
Para garantir uma comunicação clara e práticas de desenvolvimento consistentes, a documentação e as convenções precisavam de refinamento.

## Decisão
- **Refatoração de `GEMINI.md`:** Refatorado `GEMINI.md` para ser conciso e focado nas diretrizes de colaboração para o Gemini, incluindo commits atômicos, autodocumentação e priorização de ferramentas.
- **Gerenciamento de Logs de Varredura:**
    - Modificado `bin/create_challenge.sh` para criar automaticamente um subdiretório `scans/` dentro de cada diretório de desafio.
    - Modificado `tools/nmap_scan.sh` para salvar os resultados da varredura na pasta `scans/` por padrão.
    - Atualizado `README.md` e `GEMINI.md` para instruir os usuários a navegar até o diretório do desafio antes de executar `nmap_scan.sh`.

## Consequências
- Melhoria na clareza e consistência da documentação.
- Resultados de varredura centralizados dentro dos diretórios de desafio, evitando a desorganização do repositório.
- Diretrizes mais claras para a interação e contribuição do Gemini.