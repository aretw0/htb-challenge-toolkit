# 0011 - Abandonment and Deletion of .env.example

## Status
Accepted

## Context
The `.env.example` file previously contained VPN-related environment variables that are no longer used for automatic initialization. With the shift to explicit control and direct script execution, this file has become redundant and can cause confusion.

## Decision
To simplify the project and avoid unnecessary configuration, the `.env.example` file will be completely abandoned and deleted from the repository.

## Consequences
- Further simplifies the project setup by removing a redundant file.
- Eliminates potential confusion for users regarding unused or outdated environment variables.
- Reinforces the philosophy of explicit control, where users directly manage their VPN configuration and other environment-specific settings as needed.
