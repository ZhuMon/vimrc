#!$SHELL
# Program: 
#   set .vimrc
# build time: 
#   2019/1/5
# last change:
#   2020/02/20

sudo apt install git
sudo apt install vim
sudo apt install curl
rm -f ~/.vimrc
link ./.vimrc ~/.vimrc
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/nerdcommenter
