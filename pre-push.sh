#!/bin/sh
echo "Syncing files..."
./sync.sh
echo "Committing last changes..."
git add .
git commit -m "File Sync"