# Guidelines for Gemini Collaboration

This file contains essential guidelines and context for Gemini regarding this project, aiming to optimize collaboration.

## Operational Guidelines

*   **Atomic Commits:** Record progress with clear and descriptive commits, following the Conventional Commits convention (e.g., `feat:`, `fix:`, `refactor:`, `chore:`).
*   **Self-Documentation:** Maintain the repository self-documented through commits and file structure.
*   **Environment Neutrality:** Avoid including developer-specific local environment information (usernames, absolute paths, etc.) in versioned files. Exceptions are generic examples in documentation (e.g., `/foo/bar`).
*   **Tool Prioritization:** Whenever possible, use existing scripts and tools in the repository to perform tasks.

## Project Structure

Understanding the repository organization for file location and context:

*   `.devcontainer/`: VS Code Dev Container configurations.
*   `bin/`: Repository management scripts (e.g., `create_challenge.sh`).
*   `docker/`: `Dockerfile` and `docker-compose.yml` for the Docker environment.
*   `challenges/`: Folders for each HTB challenge, containing `WRITEUP.md` and specific artifacts. Each challenge folder also contains a `scans/` subfolder for scan results.
*   `docs/`: Contains detailed documentation about the project architecture and Architectural Decision Records (ADRs).
    *   `docs/architecture/`: Diagrams and explanations about the Docker and VPN architecture.
    *   `docs/adr/`: Architectural Decision Records (ADRs) that document the "why" behind key design choices.
*   `templates/`: Templates for new files (e.g., `WRITEUP_TEMPLATE.md`).
*   `tools/`: Contains pentest utility scripts (e.g., `nmap_scan.sh`). Scan results are automatically saved in the `scans/` folder of the current challenge.

## Development Environment

The environment is isolated via Docker, including `nmap` and `openvpn`. The VPN connection is no longer automatically initiated when the container starts. Instead, the developer has explicit control over when and how to initiate the VPN connection by manually executing the `connect_vpn.sh` script inside the container.

**Docker Compose Configuration Details:**
- The `docker-compose.yml` mounts the project root (`..`) to `/workspace` inside the container, ensuring all project files are accessible.
- Docker Compose automatically loads environment variables from a `.env` file located in the project root (the `docker-compose` execution directory), without the need for an explicit `env_file` directive in `docker-compose.yml`.

## Common Workflow

*   **Challenge Creation:** `bin/create_challenge.sh <challenge_name>` (This will create `challenges/<challenge_name>/WRITEUP.md` and the `challenges/<challenge_name>/scans/` folder. The challenge name can be the name of an individual machine or a Path/series of machines.)

**Note for VS Code Dev Container Users:**
When you open the project in a Dev Container, the VS Code terminal is already *inside* the `pentest-env` container. This means that:
- `make` commands like `make shell`, `make vpn-global`, `make vpn-challenge`, and `make nmap-scan` will still work, but they will make a redundant `docker exec` call to the very container you are already in.
- For greater efficiency, it is recommended to execute scripts directly by their full path within the container, for example: `/workspace/tools/connect_vpn.sh` or `/workspace/tools/nmap_scan.sh <IP_ADDRESS>`.
- `make up`, `make down`, and `make clean` commands are still useful for managing the container lifecycle from your local terminal (outside the Dev Container).

*   **Environment Startup:**
    ```bash
    make up
    ```
*   **VPN Connection:**
    -   **Global:**
        ```bash
        make vpn-global
        ```
    -   **Challenge-Specific:**
        ```bash
        make vpn-challenge CHALLENGE=<challenge_name>
        ```
*   **Scan Execution:**
    -   **Basic:**
        ```bash
        make nmap-scan IP=<IP_ADDRESS>
        ```
    -   **With Output Directory:**
        ```bash
        make nmap-scan IP=<IP_ADDRESS> OUTPUT_DIR=challenges/<challenge_name>/scans
        ```
*   **Access Container Shell:**
    ```bash
    make shell
    ```
*   **Stop Environment:**
    ```bash
    make down
    ```
*   **Clean Up Environment:**
    ```bash
    make clean
    ```

## Conventions

*   **Commit Messages:** Follow Conventional Commits.
*   **Naming:** `snake_case` for files/folders, `kebab-case` for challenge names.

## Mermaid Syntax Considerations

When editing Mermaid diagrams, especially with the `architecture-beta` and `graph` styles, it is crucial to be aware of some syntax particularities to avoid rendering errors:

*   **Node Naming and IDs:**
    *   Node IDs must be unique and simple (alphanumeric characters are safest).
    *   Avoid special characters like `()`, `[]`, `{}`, `.`, `-`, or `_` in node IDs.
    *   For labels with spaces or special characters, enclose them in double quotes: `node_id["A label with spaces"]`.

*   **Diagram-Specific Syntax:**
    *   **`architecture-beta` Style:**
        *   This style is ideal for high-level architecture diagrams.
        *   Use `group ID(mdi:icon)[Label]` for grouping nodes.
        *   Use `service ID(mdi:icon)[Label]` for defining service nodes. The `(mdi:icon)` part is optional but recommended for clarity (e.g., `mdi:docker`, `mdi:server`, `mdi:laptop`).
    *   **`graph` Style (e.g., `graph TD`):**
        *   This style is versatile for flowcharts and other diagrams.
        *   Nodes are defined simply as `ID[Label]` or `ID(Label)`.
        *   Use the `style` directive to apply custom CSS-like styling: `style NODE_ID fill:#f9f,stroke:#333,stroke-width:4px`.

*   **Connectors:** Use `-->` for directed arrows. For labels on connectors, use double quotes: `A -- "My Label" --> B`.

*   **Subgraphs:** Subgraph names should follow the same naming conventions as nodes to avoid interpretation issues.

Always validate your diagrams in a Mermaid editor or visualization tool to ensure correct rendering.
