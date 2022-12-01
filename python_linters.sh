#!/bin/sh
# This script is used to run the python linters on the codebase.

script_dir=`dirname "$0"`
# Run pylint on the codebase.
pylint --rcfile $script_dir/linters/.python-lint $1 

# Run flake8 on the codebase.
flake8 --config=$script_dir/linters/.flake8 $1

# Run mypy on the codebase.
mypy --config-file=$script_dir/linters/.mypy.ini $1

# Run black on the codebase.
black --config=$script_dir/linters/.python-black $1

# Run isort on the codebase.
isort --settings-path=$script_dir/linters/.isort.cfg $1

