#!/bin/bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link .vimrc, .inputrc, and .gitignore
ln -sf ~/configManager/.vimrc ~
ln -sf ~/configManager/.inputrc ~
ln -sf ~/configManager/.gitignore ~

# install ctags
sudo apt-get install ctags -y

# Set git config
sudo apt-get install git -y
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global merge.tool vimdiff
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore
