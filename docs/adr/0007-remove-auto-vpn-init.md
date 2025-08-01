# 0007 - Removal of Automatic VPN Initialization

## Status
Accepted

## Context
Automatic VPN initialization in the `postStartCommand` of the Dev Container and the `command` of `docker-compose.yml` introduced unnecessary complexity and dependencies.

## Decision
- Removed `command: /usr/local/bin/start_vpn.sh` from `docker/docker-compose.yml`.
- Removed `postStartCommand: /usr/local/bin/start_vpn.sh` from `.devcontainer/devcontainer.json`.
- The container now starts with its default shell, and the VPN connection is initiated manually by the user.

## Consequences
- Simplified the environment setup by removing implicit behaviors.
- Gave developers explicit control over when to initiate the VPN connection.
- Reduced potential issues related to VPN startup failures during environment initialization.
