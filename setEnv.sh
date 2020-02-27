#!/bin/sh

if [ "$(uname)"=="Darwin" ]; then
    echo "export CLANG_FORMAT_PATH to ~/.zshrc"
    echo "export CLANG_FORMAT_PATH=\"/usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py\"" >> ~/.zshrc
elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then
    echo "export CLANG_FORMAT_PATH to ~/.zshrc"
    echo "export CLANG_FORMAT_PATH=\"/usr/share/vim/addons/syntax/clang-format.py\"" >> ~/.zshrc
elif [ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]; then
    echo "I don't know where clang-format.py is"
fi

