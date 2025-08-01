# 0013 - Introduction of Makefile for Command Simplification

## Status
Accepted

## Context
Executing Docker Compose commands and utility scripts often required long and repetitive commands, especially for terminal users.

## Decision
A `Makefile` was created in the project root with targets to simplify common operations:
- `make up`: Start the Docker Compose environment.
- `make down`: Stop the Docker Compose environment.
- `make clean`: Stop and remove all Docker Compose resources.
- `make shell`: Access the container shell.
- `make vpn-global`: Connect to VPN using `global.ovpn`.
- `make vpn-challenge CHALLENGE=<challenge_name>`: Connect to a challenge-specific VPN.
- `make nmap-scan IP=<target_ip> [OUTPUT_DIR=<output_directory>]`: Execute an Nmap scan.

## Consequences
- Significantly simplified the developer experience, making commands shorter and easier to remember.
- Provided a centralized and consistent interface for managing the development environment.
- Improved overall usability for terminal-first developers.
