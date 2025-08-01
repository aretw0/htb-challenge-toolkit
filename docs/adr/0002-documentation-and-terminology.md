# 0002 - Documentação e Terminologia

## Status
Aceito

## Contexto
Para garantir clareza e consistência, a documentação do projeto e a terminologia interna precisavam de um refinamento. O uso intercambiável de "desafio" e "máquina" era impreciso, e a gestão dos resultados de varreduras de segurança precisava de padronização.

## Decisão
Foram implementadas as seguintes melhorias:

1.  **Refinamento da Documentação:** O `GEMINI.md` foi focado em diretrizes de colaboração, e um `JOURNAL.md` foi criado para registrar a evolução do projeto.
2.  **Centralização dos Resultados de Varredura:** O script `create_challenge.sh` passou a criar um subdiretório `scans/` em cada desafio, e o `nmap_scan.sh` foi ajustado para salvar os resultados nesse diretório.
3.  **Esclarecimento da Terminologia:** A documentação e os templates foram atualizados para distinguir claramente entre um **"desafio"** (um Path ou série de máquinas) e uma **"máquina"** individual.

## Consequências
- Comunicação clara e precisa em toda a documentação.
- Melhor organização dos artefatos de cada desafio.
- Um kit de ferramentas mais flexível e capaz de suportar cenários complexos do Hack The Box.
