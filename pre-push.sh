#!/bin/sh
echo "Running pre-push script..."
./sync.sh
echo "Committing last changes..."
if git diff-index --quiet HEAD --
    git add .
    git commit -m "File Sync"