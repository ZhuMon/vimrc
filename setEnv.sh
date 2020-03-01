#!/bin/sh
# Set environment of clang-format

sysOS=`uname`

if [ $sysOS = "Darwin" ]; then
    echo "On Mac OSX"
    echo "export CLANG_FORMAT_PATH to ~/.zshrc"
    echo "export CLANG_FORMAT_PATH=\"/usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py\"" >> ~/.zshrc
    echo "export clang_format_fallback_style=\"$PWD/.clang-format\"" >> ~/.zshrc

elif [ $sysOS = "Linux" ]; then
    echo "On Linux"
    echo "export CLANG_FORMAT_PATH to ~/.zshrc"
    echo "export CLANG_FORMAT_PATH=\"/usr/share/vim/addons/syntax/clang-format.py\"" >> ~/.zshrc
    echo "export clang_format_fallback_style=\"$PWD/.clang-format\"" >> ~/.zshrc
else
    echo "I don't know where clang-format.py is"
fi
