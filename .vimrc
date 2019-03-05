syntax on
set ai
set shiftwidth=4
set tabstop=8
set softtabstop=4
"set noexpandtab
set expandtab

set ruler
set mouse=a

set nu
set nuw=1
set cursorline

hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE 
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

inoremap ( ()<LEFT>
inoremap () ()
inoremap (( (
inoremap {<CR> {<CR>}<Esc>kA<CR>

inoremap <c-o> <Esc>o
inoremap <c-d> <Esc>ddi
"make a word to Uppercase
inoremap <c-u> <Esc>viwU`>a
inoremap jk <Esc>
"inoremap <Esc> <nop>
inoremap <c-j> <Esc>I
inoremap <c-k> <Esc>A
inoremap <c-y> <Esc>yya
inoremap <c-p> <Esc>pa
inoremap <c-x> <Esc>lxi

let mapleader=";"
inoremap <leader>; <Esc>d^xi
inoremap <leader>;<space> ;
"Make a word wrap by "
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>lela
inoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>lela

"indent 
inoremap <leader>> <Esc>>>a
inoremap <leader>< <Esc><<a

nnoremap <leader>" i<esc>viw<esc>a"<esc>bi"<esc>lel

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <c-=> 0ggVG=

"iabbrev adn and

filetype indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"jjkk" | endif
endif

":onoremap p i(
"onoremap b /return<cr>
"onoremap in( :<c-u>normal! f(vi(<cr>
"onoremap il( :<c-u>normal! F)vi(<cr>

"Plug 'rightson/vim-p4-syntax'

autocmd BufNewFile *.dots call ManyBlank()

function ManyBlank()
    let i = 0
    while i <= 10
        :normal i                                    
        :normal o
        let i += 1
    endwhile
    :normal gg
    let i = 0
    while i <= 35
        :normal h
        let i += 1
    endwhile

    :normal R
    return "hi" 
endfunction

