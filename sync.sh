#!/bin/bash

#function sync(src, dest){
#	rsync -a ${HOME}+src ${HOME}/dest
#}

echo "Syncing Config Files. "
cd ~/configs
rm -rf Brewfile
brew bundle dump
rsync -a ${HOME}/dotfiles ${HOME}/configs/
rsync -a ${HOME}/bin ${HOME}/configs/
rsync -a ${HOME}/Brewfile ${HOME}/configs/Brewfile

