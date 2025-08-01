# Copilot Instructions

This document provides guidelines and context for using GitHub Copilot effectively within this project.

## General Guidelines

*   **Context Awareness:** Copilot is powerful when given good context. Ensure your code, comments, and surrounding files provide enough information for Copilot to generate relevant suggestions.
*   **Review Suggestions:** Always review Copilot's suggestions carefully. Do not blindly accept them. Verify correctness, adherence to project conventions, and security implications.
*   **Iterative Refinement:** If Copilot's initial suggestion isn't perfect, try providing more context, adding comments, or writing a few lines of code yourself to guide it towards the desired outcome.
*   **Security:** Be extra vigilant when Copilot suggests code related to security-sensitive operations (e.g., authentication, authorization, data handling). Always double-check for vulnerabilities.
*   **Licensing:** Be mindful of the licenses of code snippets Copilot might suggest, especially if they are derived from public repositories. While Copilot aims to avoid direct replication, it's good practice to be aware.

## Project-Specific Context

This project is a Hack The Box challenge toolkit with a focus on a streamlined and explicitly controlled development environment using Docker and VPN configurations.

*   **Language/Frameworks:** Primarily Bash scripting for automation and Docker for environment setup.
*   **Directory Structure:** Refer to the `README.md` and `docs/` directory for the project's structure and conventions.
    *   `bin/`: Repository management scripts.
    *   `tools/`: Pentest utility scripts.
    *   `challenges/`: Challenge-specific files and writeups.
    *   `docker/`: Dockerfile and docker-compose.yml.
    *   `docs/`: Detailed documentation, including ADRs and architecture diagrams. **When creating or modifying ADRs, remember to also update `JOURNAL.md` to keep the summary consistent.**
*   **Key Scripts:**
    *   `bin/create_challenge.sh`: For creating new challenge structures.
    *   `tools/connect_vpn.sh`: For manual VPN connection.
    *   `tools/nmap_scan.sh`: For Nmap scanning.
*   **Makefile:** The `Makefile` in the project root simplifies common Docker and script execution commands. Copilot should be aware of these targets when suggesting commands.
*   **Documentation:** The project emphasizes clear and concise documentation. When generating comments or documentation, adhere to the existing style and focus on *why* something is done.

## Mermaid Diagrams

This project uses Mermaid for architecture diagrams. When working with Mermaid syntax, especially for the `architecture-beta` and `graph` styles, keep the following in mind:

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

Always validate Mermaid syntax in a previewer to ensure correct rendering.
