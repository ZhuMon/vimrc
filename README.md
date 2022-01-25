# VIMRC
## Warning!! This will remove your origin ~/.vimrc
## Usage
* Set vim
    ```
    sh setting.sh
    ```

* Set zsh
    ```
    sh setzsh.sh
    ```
* Set Default editor as vim
    ```
    sh setEnv.sh
    ```

## p4 config
* add `au BufRead, BufNewFile *.p4, *.P4 set filetype=p4` in `$HOME/.vim/ftdetect/p4.vim`
* move `p4.vim` to `$HOME/.vim/syntax`
* like
    ```
    .vim
    ├── ftdetect
    │   └── p4.vim
    └── syntax
        └── p4.vim
    ```
## Git Setting
* type following, so you can just type `git root` to turn to git root directory
```
git config --global alias.root 'rev-parse --show-toplevel'
```

## zsh setting
```
alias gs="git status"
alias cdroot='cd $(git root)'
alias python3="python3 -B"
alias pip="sudo pip"
alias pip3="sudo pip3"
alias open="xdg-open"
```
