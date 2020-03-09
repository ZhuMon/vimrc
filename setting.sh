#!$SHELL
# Program: 
#   set .vimrc
# build time: 
#   2019/1/5
# last change:
#   2020/03/10

# install dependency
$SUDO apt-get update
$SUDO apt-get install -y build-essential cmake python3-dev python3-pip zsh git curl sed

# link .vimrc
rm -f $HOME/.vimrc
link ./.vimrc $HOME/.vimrc

# plugin
mkdir ~/.vim/bundle
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# temporally remove YouCompleteMe
sed -i "s/Plugin 'Valloric\/YouCompleteMe'/\"@@@/" $HOME/.vimrc
vim -E -s -u "$HOME/.vimrc" +PluginInstall +qall
sed -i "s/\"@@@/Plugin 'Valloric\/YouCompleteMe'/" $HOME/.vimrc

# install YouCompleteMe
git clone --depth=1 https://github.com/Valloric/YouCompleteMe $HOME/.vim/bundle/YouCompleteMe
cd $HOME/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clang-completer

cd ~
