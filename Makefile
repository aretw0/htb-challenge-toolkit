# Makefile for HTB-Challenge-Toolkit

.PHONY: up down clean shell vpn-global vpn-challenge nmap-scan

# Variables
COMPOSE_FILE := docker/docker-compose.yml
CONTAINER_NAME := docker_pentest-env_1

# Bring up the Docker Compose environment in detached mode
up:
	@echo "Bringing up the Docker Compose environment..."
	docker-compose -f $(COMPOSE_FILE) up -d
	@echo "Environment is up. Use 'make shell' to access the container."

# Bring down the Docker Compose environment
down:
	@echo "Bringing down the Docker Compose environment..."
	docker-compose -f $(COMPOSE_FILE) down
	@echo "Environment is down."

# Stop and remove containers, networks, and anonymous volumes for a clean restart
clean:
	@echo "Cleaning up Docker Compose environment (stopping and removing all resources)..."
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@echo "Environment cleaned."

# Get a bash shell inside the running container
shell:
	@echo "Accessing container shell..."
	docker exec -it $(CONTAINER_NAME) bash

# Connect to the global VPN
vpn-global:
	@echo "Connecting to global VPN..."
	docker exec -it $(CONTAINER_NAME) /workspace/tools/connect_vpn.sh
	@echo "Check container logs for VPN status: docker-compose -f $(COMPOSE_FILE) logs pentest-env"

# Connect to a challenge-specific VPN
# Usage: make vpn-challenge CHALLENGE=cap
vpn-challenge:
ifndef CHALLENGE
	$(error CHALLENGE is not set. Usage: make vpn-challenge CHALLENGE=<challenge_name>)
endif
	@echo "Connecting to VPN for challenge: $(CHALLENGE)..."
	docker exec -it $(CONTAINER_NAME) /workspace/tools/connect_vpn.sh challenges/$(CHALLENGE)/$(CHALLENGE).ovpn
	@echo "Check container logs for VPN status: docker-compose -f $(COMPOSE_FILE) logs pentest-env"

# Run an Nmap scan
# Usage: make nmap-scan IP=10.10.10.245 [OUTPUT_DIR=challenges/cap/scans]
nmap-scan:
ifndef IP
	$(error IP is not set. Usage: make nmap-scan IP=<target_ip> [OUTPUT_DIR=<output_directory>])
endif
	@echo "Running Nmap scan on $(IP)..."
ifdef OUTPUT_DIR
	docker exec -it $(CONTAINER_NAME) /workspace/tools/nmap_scan.sh -o $(OUTPUT_DIR) $(IP)
else
	docker exec -it $(CONTAINER_NAME) /workspace/tools/nmap_scan.sh $(IP)
endif
	@echo "Nmap scan initiated. Results will be in the specified output directory or 'scans/'."
