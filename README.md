# cap

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

## Sinopse

Cap é uma máquina Linux de dificuldade fácil que executa um servidor HTTP que realiza funções administrativas, incluindo a execução de capturas de rede.
Controles inadequados resultam em uma vulnerabilidade de Insecure Direct Object Reference (IDOR), dando acesso à captura de outro usuário.
A captura contém credenciais em texto plano e pode ser usada para obter um acesso inicial (foothold).
Uma capability do Linux é então aproveitada para escalar para root.

## Enumeração

Quantas portas TCP estão abertas?

```bash
ports=$(nmap -p- --min-rate=1000 -Pn -T4 10.10.10.245 | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -p$ports -Pn -sC -sV 10.10.10.245
```
