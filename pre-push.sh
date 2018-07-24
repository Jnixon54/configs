#!/bin/sh
echo "Running pre-push script..."
./sync.sh
echo "Committing last changes..."
git add .
git commit -m "File Sync"