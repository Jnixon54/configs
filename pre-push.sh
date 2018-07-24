#!/bin/sh
echo "Running pre-push script..."
./sync.sh
if [[ -z $(git status -s) ]]
then
    echo "Pushing..."
else
    echo "Committing last changes..."
    git add .
    git commit -m "File Snc"
fi
