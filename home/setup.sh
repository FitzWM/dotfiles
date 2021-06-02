#!/bin/bash

cd

# Set up Zsh
ln -s ~/.dot/home/zshrc .zshrc
ln -s ~/.dot/home/.zsh .zsh
mkdir -p ~/.cache/zsh

# Set up Vim and backup directory.
ln -s ~/.dot/home/vimrc .vimrc
mkdir -p .vim/tmp

# Change default shell and reload.
chsh -s /bin/zsh
exec zsh

exit
