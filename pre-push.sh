#!/bin/sh
echo "Running pre-push script..."
./sync.sh
if git diff-index --quiet HEAD -- || false
then
    echo "Committing last changes..."
    git add .
    git commit -m "File Sync"
    git push origin master
fi
