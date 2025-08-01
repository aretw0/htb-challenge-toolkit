# 0005 - Simplified and Flexible VPN Configuration

## Status
Accepted

## Context
The previous VPN configuration required manual definition of environment variables, which was not ideal for different development environments (terminal vs. VS Code Dev Containers).

## Decision
- Refactored the `docker/start_vpn.sh` script (now `tools/connect_vpn.sh`) to implement a priority chain for `.ovpn` file lookup:
    1.  Explicit path via argument (highest priority).
    2.  `challenges/<CHALLENGE_NAME>/<CHALLENGE_NAME>.ovpn` (if `CHALLENGE_NAME` is provided).
    3.  `/workspace/global.ovpn` (fallback).
- Removed explicit `OVPN_CONFIG_FILE` configuration from `.devcontainer/devcontainer.json`, relying on automatic `.env` reading by the Dev Container.
- Updated `README.md`, `GEMINI.md`, and `.env.example` to clearly document the new priority chain and methods for defining `OVPN_CONFIG_FILE` and `CHALLENGE_NAME` (via `.env` or command line).

## Consequences
- More flexible and user-friendly VPN configuration.
- Reduced manual setup steps for different environments.
- Clearer documentation on VPN connection options.
