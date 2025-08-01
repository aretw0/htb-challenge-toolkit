# 0012 - Standardization of Docker Compose Execution

## Status
Accepted

## Context
The previous documentation suggested executing `docker-compose` from subdirectories, which could lead to inconsistencies and confusion regarding context.

## Decision
The documentation now explicitly emphasizes that `docker-compose` commands should always be executed from the project root directory.

## Consequences
- Ensures consistent behavior and context for all Docker Compose operations.
- Simplifies user instructions and reduces potential errors.
- Aligns with common best practices for Docker Compose projects.
