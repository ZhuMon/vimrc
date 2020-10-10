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
