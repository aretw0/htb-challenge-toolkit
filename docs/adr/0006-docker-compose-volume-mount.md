# 0006 - Docker Compose Volume Mount Correction

## Status
Accepted

## Context
During terminal environment testing, it was identified that `global.ovpn` was not being found inside the container, despite being present in the project root on the host. Debugging revealed that the volume mount in `docker-compose.yml` (`- .:/workspace:cached`) was mounting the `docker/` folder itself to `/workspace` inside the container, instead of the project root. Additionally, the `env_file: .env` directive in `docker-compose.yml` was causing issues by looking for `.env` in the `docker/` directory instead of the project root.

## Decision
- Changed the volume mount in `docker/docker-compose.yml` from `- .:/workspace:cached` to `- ..:/workspace:cached`, ensuring the project root is correctly mounted to `/workspace`.
- Removed the `env_file: .env` line from `docker/docker-compose.yml`, allowing Docker Compose to use its default behavior of looking for `.env` in the execution directory (project root).
- Manual verification inside the container (`docker exec -it <container_id> bash` and `ls -l /workspace`) was performed to confirm the presence of expected files.

## Consequences
- Corrected file access within the container, making all project files accessible at `/workspace`.
- Simplified environment variable loading by relying on Docker Compose's default `.env` handling.
- Ensured consistent behavior across different development environments.
