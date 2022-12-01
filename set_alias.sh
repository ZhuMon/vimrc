#!/bin/sh
set -xe

# p means execute all python-related linter for file $1
if [ $SHELL = '/bin/bash' ]
then
    echo "alias p=\"$PWD/python_linters.sh\"" >> ~/.bashrc
elif [ $SHELL = '/bin/zsh' ]
then
    echo "alias p=\"$PWD/python_linters.sh\"" >> ~/.zshrc
fi
