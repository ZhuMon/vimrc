#!$SHELL
# Program:
#   install dependency for linux class
# build time:
#   2020/3/25
# last change:
#   2020/3/25

if [ `uname` != "Linux" ]; then
    echo "Not in Linux, exit."
    exit 0;
fi

sudo apt install build-essential git-core valgrind
sudo apt install cppcheck clang-format aspell colordiff valgrind

if [ `echo $SHELL | grep zsh` ]; then
    shellrc="$HOME/.zshrc"
elif [ `echo $SHELL | grep bash` ]; then
    shellrc="$HOME/.bashrc"
fi

# build cppcheck to 1.90
CPPCHECK_VER=$(cppcheck --version | sed -Ee 's/Cppcheck 1.([0-9]+)/\1/;q')
if [ $CPPCHECK_VER -lt 90 ]; then
    sudo snap install cppcheck
    echo "export PATH=/snap/bin:\$PATH" >> ${shellrc}
fi

echo "Remember to re-source ${shellrc}"
