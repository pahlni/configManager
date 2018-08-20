#!/bin/bash

# install latex
sudo apt-get install texlive-full -y

# install vim-gtk which has needed clientserver feature
sudo apt-get install vim-gtk -y

# vimtex needs vim to be a server so adding this alias to bashrc
echo "alias vim='vim --servername VIM'" >> ~/.bashrc
source ~/.bashrc

# use :VimtexCompile to enable live compile after saving a file
