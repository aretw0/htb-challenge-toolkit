# 0003 - Filosofia de VPN e Scripts: Controle Explícito

## Status
Aceito

## Contexto
A abordagem inicial para a conexão VPN e a execução de scripts era excessivamente automatizada, com lógicas implícitas que reduziam a clareza e o controle do desenvolvedor. A filosofia do projeto evoluiu para priorizar a transparência e o controle explícito do usuário.

## Decisão
As seguintes mudanças foram feitas para alinhar as ferramentas com esta filosofia:

1.  **Controle Manual da VPN:** A inicialização automática da VPN foi removida. O desenvolvedor agora tem controle total sobre quando e como a conexão é estabelecida através do script `connect_vpn.sh`, que aceita o caminho do arquivo `.ovpn` como um argumento explícito.

2.  **Scripts Explícitos e Previsíveis:**
    *   O script `nmap_scan.sh` foi simplificado para ter um comportamento de saída padrão e previsível (`scans/`), que pode ser sobrescrito explicitamente com um argumento.
    *   A criação automática de arquivos de placeholder (`.ovpn`) pelo script `create_challenge.sh` foi removida.

## Consequências
- **Empoderamento do Desenvolvedor:** Os usuários têm controle total sobre as ferramentas, sem ações "mágicas" ou inesperadas.
- **Simplicidade e Manutenibilidade:** Scripts mais simples, sem lógicas complexas de adivinhação, são mais fáceis de entender e manter.
- **Consistência Filosófica:** O kit de ferramentas se tornou mais robusto e transparente, alinhado com as melhores práticas de ferramentas de linha de comando.
