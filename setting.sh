#!$SHELL
# Program: 
#   set .vimrc
# build time: 
#   2019/1/5
# last change:
#   2023/12/19

# install dependency

sysOS=`uname`
if [ $sysOS = "Darwin" ]; then
    echo "On Mac OSX"
    #brew install cmake python3 mono go nodejs

elif [ $sysOS = "Linux" ]; then
    echo "On Linux, Install dependency"
    sudo apt-get update
    sudo apt-get install -y build-essential cmake python3-dev python3-pip zsh git curl sed clang-format
    # for vim plugin md-img-paste
    sudo apt-get install -y xclip
    sudo apt install -y cmake vim-nox
    python3 -m pip install autopep8
    # latex dependency
    #sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra latex-cjk-all
elif [ `uname | cut -d"-" -f1` = "MINGW64_NT" ]; then
    pacman -S git mingw-w64-x86_64-gcc sed make
else
    echo "On Windows?"


fi


# link .vimrc
mkdir -p $HOME/.config/nvim
rm -f $HOME/.config/nvim/init.vim
link ./.vimrc $HOME/.config/nvim/init.vim

# plugin
mkdir -p $HOME/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# install YouCompleteMe
#git clone https://github.com/Valloric/YouCompleteMe $HOME/.vim/bundle/YouCompleteMe
#cd $HOME/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#python3 install.py --clangd-completer

nvim -E -s -u "$HOME/.config/nvim/init.vim" +PluginInstall +qall
cd ~
