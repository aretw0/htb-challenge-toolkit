# Relatório de Resolução - Hack The Box: Cap

**Autor:** aretw0
**Data de Início:** 01 de Agosto de 2025
**Máquina:** Cap

## Objetivo

Este documento serve para registrar o processo de análise e exploração da máquina "Cap" da plataforma Hack The Box.

---

## Diário de Bordo

### 2025-08-01

- Início do desafio.
- Criação do arquivo de documentação `WRITEUP.md`.
- Ambiente de trabalho configurado em `/home/aretw0/htb/cap`.

---

## Fase de Reconhecimento

### Informações da Máquina (do README original)

| Atributo                  | Valor                                         |
| ------------------------- | --------------------------------------------- |
| **Data**                  | 20 de Setembro de 2021                        |
| **Nº do Documento**       | D21.100.132                                   |
| **Preparado Por**         | MinatoTW                                      |
| **Autor(es) da Máquina**  | infosecjack                                   |
| **Dificuldade**           | Fácil                                         |
| **Classificação**         | Oficial                                       |
| **Habilidade Necessária** | Enumeração Web, Análise de captura de pacotes |
| **Habilidade Aprendida**  | IDOR, Exploração de capabilities do Linux     |

#### Sinopse

Cap é uma máquina Linux de dificuldade fácil que executa um servidor HTTP que realiza funções administrativas, incluindo a execução de capturas de rede.
Controles inadequados resultam em uma vulnerabilidade de Insecure Direct Object Reference (IDOR), dando acesso à captura de outro usuário.
A captura contém credenciais em texto plano e pode ser usada para obter um acesso inicial (foothold).
Uma capability do Linux é então aproveitada para escalar para root.

#### Comando Nmap Original

Quantas portas TCP estão abertas?

```bash
ports=$(nmap -p- --min-rate=1000 -Pn -T4 10.10.10.245 | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -p$ports -Pn -sC -sV 10.10.10.245
```

_Nesta seção, vamos documentar a varredura inicial de portas, serviços e tecnologias utilizadas pela máquina alvo._

## Fase de Enumeração

_Aqui, detalharemos a enumeração de cada serviço encontrado, em busca de vulnerabilidades ou informações úteis._

## Obtenção de Acesso Inicial

_Registro do método utilizado para conseguir o primeiro acesso à máquina (usuário comum)._

## Escalação de Privilégio

_Passos detalhados sobre como o acesso de usuário foi escalado para privilégios de administrador (root)._

## Coleta de Provas (Flags)

_Localização e conteúdo das flags de usuário e root._
