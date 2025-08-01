FROM mcr.microsoft.com/vscode/devcontainers/base:debian

# Instala as ferramentas de pentest essenciais
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive     && apt-get -y install --no-install-recommends openvpn nmap procps net-tools iputils-ping

# Copia o script de inicialização da VPN e o torna executável
COPY ./tools/connect_vpn.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_vpn.sh
