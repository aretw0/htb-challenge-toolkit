# Docker and VPN Architecture

This document details the architecture of the Docker environment and the VPN connection within the HTB-Challenge-Toolkit.

## 1. Docker Environment Overview

(Add a high-level overview of the Docker setup, including `Dockerfile` and `docker-compose.yml` roles.)

## 2. VPN Connection Flow

(Explain how the VPN connection is established, referencing `connect_vpn.sh` and the `.ovpn` file locations.)

### VPN Connection Diagram

```mermaid
graph TD
    A[Host Machine] --> B(Docker Daemon)
    B --> C[pentest-env Container]
    C --> D[connect_vpn.sh]
    D --> E[OpenVPN Client]
    E --> F[VPN Server (HTB)]

    subgraph Volume Mount
        G[/home/aretw0/htb/cap/] --> H[/workspace in Container]
    end

    H --> D
    H --> E

    style G fill:#f9f,stroke:#333,stroke-width:2px
    style H fill:#bbf,stroke:#333,stroke-width:2px
```

## 3. Volume Mounts and File Access

(Detail how host files are accessed within the container, specifically mentioning `/workspace`.)

## 4. Tooling and Script Execution

(Explain how `nmap_scan.sh` and other tools are executed within the container.)
