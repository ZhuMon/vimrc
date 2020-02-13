syntax on
set ai
set shiftwidth=4
set tabstop=8
set softtabstop=4
"set noexpandtab
set expandtab
set noautoindent
" end of line will appear $
"set list

set t_Co=256
set ruler
set mouse=a

set nu
set nuw=1
set cursorline

""" highlight text
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE 
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
highlight Folded ctermfg=1 guifg=Red
highlight FoldColumn ctermfg=1 guifg=Red

set nocompatible
filetype off                     "required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'prettier/vim-prettier'
Plugin 'mtdl9/vim-log-highlighting'
call vundle#end()
filetype plugin indent on
filetype plugin on
let g:SimpylFold_docstring_preview = 0

set foldmethod=expr
"set foldlevel=99
au BufWinLeave * silent mkview  " 保存文件的折疊狀態
au BufRead * silent loadview    " 恢復文件的折疊狀態
nnoremap <space> za		" 用空格來切換折疊狀態
" zR : open all fold
" zM : close all fold
set backspace=indent,eol,start


""""""""""""""
":echom foldlevel(1)
set foldexpr=GetPotionFold(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2

endfunction 

function! GetPotionFold(lnum)
    let current = IndentLevel(a:lnum+1)
    " if next line is ####, level is 2
    " then the level of this line is 1.5
    if getline(a:lnum+1) =~? '\v^\s*\#\#\#\#.*$' 
        return '<'.current
    elseif getline(a:lnum) =~? '\v^\s*$' 
        " blank line
        return -1
    endif
    return IndentLevel(a:lnum)
endfunction


""""""""""""""

"inoremap ( ()<LEFT>
"inoremap () ()
"inoremap (( (
inoremap {<CR> {<CR>}<Esc>kA<CR>

inoremap <c-o> <Esc>o
inoremap <c-d> <Esc>ddi

"make a word to Uppercase
inoremap <c-u> <Esc>viwU`>a

inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>

"inoremap <Esc> <nop>
inoremap <c-y> <Esc>yya
inoremap <c-p> <Esc>pa
inoremap <c-x> <Esc>lxi

let mapleader="0"
"Make a word wrap by "
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>lela
inoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>lela
inoremap <leader>[] <esc>viw<esc>a]<esc>bi[<esc>lela
inoremap <leader>() <esc>viw<esc>a)<esc>bi(<esc>lela
inoremap <leader>{} <esc>viw<esc>a}<esc>bi{<esc>lela
nnoremap <leader>" i<esc>viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>lel

"Unwrap
inoremap <leader>u' <esc>wxbhxlea
nnoremap <leader>u' <esc>wxbhxle

"indent 
inoremap <leader>> <Esc>>>a
inoremap <leader>< <Esc><<a

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" autoindent all
nnoremap <c-=> 0ggVG=

nnoremap <c-o> o
"iabbrev adn and
iabbrev slef self
iabbrev sefl self

"nnoremap gl :YcmCompleter GoToDeclaration
"nnoremap gf :YcmCompleter GoToDefinition
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration

filetype indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"jjkk" | endif
endif

":onoremap p i(
"onoremap b /return<cr>
"onoremap in( :<c-u>normal! f(vi(<cr>
"onoremap il( :<c-u>normal! F)vi(<cr>

"autocmd BufNewFile *.dots call ManyBlank()

"function ManyBlank()
    "let i = 0
    "while i <= 50
        ":normal i                                         
        ":normal o
        "let i += 1
    "endwhile
    ":normal gg
    "let i = 0
    "while i <= 40
        ":normal h
        "let i += 1
    "endwhile

    ":normal R
    "return "hi" 
"endfunction

autocmd FileType make setlocal noexpandtab
au FileType perl set filetype=prolog
au BufNewFile,BufRead *.dots set filetype=asciidots

" push F2 or F3 to run python in vim
au BufRead,BufNewFile *.py noremap <F2> :% w !python <Enter>
au BufRead,BufNewFile *.py noremap <F3> :% w !python3 <Enter>
au BufRead,BufNewFile *.py noremap <F6> :% w !python3.6 <Enter>
au BufRead,BufNewFile .gitignore set filetype=python
au BufRead,BufNewFile *.log set filetype=log
au BufRead,BufNewFile *_log set filetype=log
