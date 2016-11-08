#!/bin/bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link .vimrc
ln -sf ~/configManager/.vimrc ~

# install ctags
sudo apt-get install ctags
