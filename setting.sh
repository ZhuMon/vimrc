#!$SHELL
# Program: 
#   set .vimrc
# build time: 
#   2019/1/5
# last change:
#   2020/10/5

# install dependency

sysOS=`uname`
if [ $sysOS = "Darwin" ]; then
    echo "On Mac OSX"

elif [ $sysOS = "Linux" ]; then
    echo "On Linux, Install dependency"
    sudo apt-get update
    sudo apt-get install -y build-essential cmake python3-dev python3-pip zsh git curl sed clang-format
    pip3 install autopep8
elif [ `uname | cut -d"-" -f1` = "MINGW64_NT" ]; then
    pacman -S git mingw-w64-x86_64-gcc sed make
else
    echo "On Windows?"


fi


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
git submodule update --init --recursive --depth=1
python3 install.py --clang-completer

cd ~
