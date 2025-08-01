# 0003 - Esclarecimento da Terminologia "Desafio" vs. "Máquina"

## Status
Aceito

## Contexto
A documentação inicial e os exemplos usavam "desafio" e "máquina" de forma intercambiável, o que não refletia com precisão os cenários do Hack The Box envolvendo múltiplos alvos (Paths).

## Decisão
- **`templates/WRITEUP_TEMPLATE.md`:** Refatorado para ser mais genérico para um "desafio" (que pode conter múltiplas máquinas), incluindo seções para documentar máquinas individuais dentro dele.
- **`bin/create_challenge.sh`:** Ajustado para usar a nova terminologia e placeholders do template.
- **`README.md` e `GEMINI.md`:** Atualizados para esclarecer a distinção entre "desafio" (Path/série de máquinas) e "máquina individual", e para fornecer exemplos de uso mais abrangentes para `create_challenge.sh`.

## Consequências
- Melhoria na clareza e precisão da terminologia em todo o projeto.
- Melhor suporte para documentar cenários complexos do Hack The Box (ex: Paths).
- Uso mais intuitivo de `create_challenge.sh` para diferentes tipos de desafios.