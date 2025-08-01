# 0008 - Simplification of VPN Connection Script

## Status
Accepted

## Context
The `start_vpn.sh` script was overloaded with `.ovpn` file priority logic and environment variable dependencies.

## Decision
- Renamed `docker/start_vpn.sh` to `tools/connect_vpn.sh`.
- Simplified the logic of `connect_vpn.sh`: it now accepts the `.ovpn` file path as an argument. If no argument is provided, it defaults to `/workspace/global.ovpn`.
- The script is now executed manually by the user inside the container (`docker exec -it <container_id> /workspace/tools/connect_vpn.sh [path/to/ovpn]`).

## Consequences
- Cleaner and more focused VPN connection script.
- Explicit control over which `.ovpn` file to use.
- Reduced complexity in the overall environment setup.
