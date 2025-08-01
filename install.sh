#!/bin/bash

REPO_URL="https://github.com/veltrix-capital/test-devops-orchestrator-ts.git"
REPO_DIR="test-devops-orchestrator-ts"

# Step 1: Clone the repository
if [ -d "$REPO_DIR/.git" ]; then
    echo "[+] Repository exists. Pulling latest changes..."
    cd "$REPO_DIR" && git pull
else
    echo "[+] Cloning repository..."
    git clone "$REPO_URL" "$REPO_DIR"
    cd "$REPO_DIR"
fi

cd "$REPO_DIR" || { echo "Failed to enter directory"; exit 1; }

# Step 2: Make scripts executable
echo "Granting execution permissions..."
chmod +x setup.sh start.sh

# Step 3: Run setup.sh
echo "Running setup.sh..."
./setup.sh

# Step 4: Run start.sh
echo "Running start.sh..."
./start.sh
