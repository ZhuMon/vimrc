"syntax on

" no compatible vi
set nocompatible
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
set ic " when searching don't mind upper or lower 
set nu
" set rnu " relative number line
set nuw=1
set cursorline

" 按下 F4 可以自由開關行號
map <F4> : set nu!<BAR>set nonu?<CR> 


""" highlight text
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE 
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
highlight Folded ctermfg=1 guifg=Red
highlight FoldColumn ctermfg=1 guifg=Red
highlight SpellBad ctermfg=1 ctermbg=224  gui=undercurl guisp=Red

"filetype off                     "required!
set rtp+=~/.nvim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'prettier/vim-prettier'
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'mbbill/undotree'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'    " snippet engine
Plugin 'honza/vim-snippets'  " snippet example
Plugin 'ervandew/supertab'
" markdown highlight
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" instantly show markdown
Plugin 'suan/vim-instant-markdown'
" latex
"Plugin 'vim-latex/vim-latex'
" Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plugin 'rhysd/vim-clang-format'
" python style format
Plugin 'psf/black'
" paste images into markdown files
Plugin 'ferrine/md-img-paste.vim'
" zeek
" Plugin 'zeek/vim-zeek'
" go
Plugin 'fatih/vim-go'
" yaml
Plugin 'yasuhiroki/github-actions-yaml.vim'
" Terraform
Plugin 'hashivim/vim-terraform'
" helm syntax
Plugin 'towolf/vim-helm'
" bash
Plugin 'z0mbix/vim-shfmt', { 'for': 'sh' }
" shellcheck
Plugin 'koalaman/shellcheck'
" ale
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on
filetype plugin on
let g:SimpylFold_docstring_preview = 0

set foldmethod=manual
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

let mapleader="9"
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

"iabbrev adn and
iabbrev slef self
iabbrev sefl self
iabbrev paramter parameter


"----------------- YCM config ----------------------------------------

"nnoremap gl :YcmCompleter GoToDeclaration
"nnoremap gf :YcmCompleter GoToDefinition
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_always_populate_location_list = 1

"set completeopt=longest,menu,preview

let g:ycm_seed_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_add_preview_to_completeopt = 0

"let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

" where to start complete
" let g:ycm_min_num_of_chars_for_completion = 2

"----------------- UltiSnip config -----------------------------------
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"


filetype indent on

"----------------- record last mouse ---------------------------------
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
au FileType gp set filetype=gnuplot

" push F2 or F3 to run python in vim
au BufRead,BufNewFile *.py noremap <F2> :% w !python <Enter>
au BufRead,BufNewFile *.py noremap <F3> :% w !python3 <Enter>
au BufRead,BufNewFile .gitignore set filetype=python
au BufRead,BufNewFile *.log set filetype=log
au BufRead,BufNewFile *_log set filetype=log

function! Formatonsave()
  let l:formatdiff = 1
  py3f $CLANG_FORMAT_PATH
endfunction

autocmd BufWrite *.h,*.hpp,*.c,*.cpp,*.c++ call Formatonsave()

nnoremap <F5> :UndotreeToggle<cr>


"----------------- Python config -------------------------------------

function! SetPythonOptions()
    " press F2 or F3 to run python file
    noremap <F2> :% w !python <CR>
    noremap <F3> :% w !python3 <CR>
endfunction

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

autocmd BufRead,BufNewFile *.py call SetPythonOptions()

"----------------- Vim Markdown config -------------------------------
function! SetMDOptions()
    """ vim-markdown
    let g:vim_markdown_math = 1 " LaTeX math
    " ]] : 前往下一個 header
    " [[ : 前往上一個 header
    " ][ : 前往上一個同層級 header
    " [] : 前往下一個同層級 header
    " ]c : 前往目前所在段落的 header，也就是在 h3 段落中會跳到所屬的 h2 header

    " :Toc 將視窗垂直切割顯示所有 header 的目錄列表，在任一 header 上按 enter 就可以直接跳至該標題
    " :InsertToc: Insert table of contents at the current line.
    " An optional argument can be used to specify how many levels of headers to display in the table of content, e.g., to display up to and including h3, use :InsertToc 3.
    " :TableFormat: Format the table under the cursor
    nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")
    """ vim-instant-markdown
    """ md-img-paste config
    " there are some defaults for image directory and image name, you can change them
    nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
    let g:mdip_imgdir = 'img'
    let g:mdip_imgname = 'image'
    let g:vim_markdown_frontmatter = 1

    " make 'DISCUSS' keywords stand out in markdown files
    highlight discuss ctermfg=black ctermbg=yellow cterm=bold gui=bold guifg=black
    "match discuss /DISCUSS/
    match discuss /ONGOING/


endfunction
autocmd BufRead,BufNewFile,FileType *.md,README,Readme call SetMDOptions()

"----------------- vim-latex -----------------------------------------
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
autocmd filetype tex imap ∫ Tex_MathBF
autocmd filetype tex imap ç Tex_MathCal
autocmd filetype tex imap ¬ Tex_LeftRight
autocmd filetype tex imap ˆ Tex_InsertItemOnThisLine

"----------------- latex live preview --------------------------------
autocmd filetype tex setl updatetime=1000
let g:livepreview_previewer = 'open -a evince'
autocmd filetype tex :LLPStartPreview
nmap <F6> :LLPStartPreview<CR>
imap <F6> <ESC>:LLPStartPreview<CR>


"----------------- Go Config -----------------------------------------
" https://github.com/fatih/vim-go
" :GoDef :GoDefType 
" 靜態分析 :GoReferrers 
" :GoRename 
" 快速查文件 :GoDoc :GoDocBrowser
function! SetGoOptions()
    set shiftwidth=8
    set tabstop=8
    set softtabstop=8
endfunction
autocmd BufRead,BufNewFile,FileType *.go call SetGoOptions()


"----------------- Cursor Config -------------------------------------

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


"----------------- Json Config -------------------------------------
" Remember to install `jq`
autocmd filetype json exe ":%!jq . --indent 4"


"----------------- Copilot Config -------------------------------------
" let g:copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
imap ‘ <Plug>(copilot-next)
imap “ <Plug>(copilot-previous)
let g:copilot_filetypes = {
            \ 'markdown': v:true, 
            \ 'yaml': v:true,
            \ 'conf': v:true,
            \ 'gitcommit': v:true,
            \ 'zsh': v:true,
            \ 'bash': v:true,
            \}

"----------------- helm Config -------------------------------------
" set the tab blank to 2 while the file type is yaml
function! SetYamlOptions()
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
endfunction
autocmd BufRead,BufNewFile,FileType *.yaml,*.yml,*.tpl call SetYamlOptions()

" set file type to helm
"set ft=helm

"----------------- ale Config -------------------------------------
let g:ale_linters = {
            \ 'yaml': ['yamllint'],
            \ 'markdown': ['markdownlint'],
            \ 'conf': ['shellcheck'],
            \ 'gitcommit': ['shellcheck'],
            \ 'zsh': ['shellcheck'],
            \ 'bash': ['shellcheck'],
            \ 'go': ['golangci-lint', 'gofmt'],
            \ 'javascript': ['eslint'],
            \ 'sql': ['sqlfluff'],
            \ 'chef': ['cookstyle'],
            \}
" python config
"   ignore line too long
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_pylint_options = '--disable=C0301 --disable=invalid-name'

" go config
" prevent go fmt from overwriting the file and let the console show the error
let g:go_fmt_fail_silently = 1

let g:ale_go_golangci_lint_package = 1

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}

" set mypy option for --namespace-packages=True
let g:ale_python_mypy_options = '--namespace-packages=True'

" set rust config
let g:ale_linters.rust = ['cargo', 'rls']
let g:ale_rust_rls_toolchain = 'stable'

" set sql config
let g:ale_sql_sqlfluff_options = '--dialect=athena'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"----------------- chef Config -------------------------------------
autocmd BufNewFile,BufRead */recipes/*.rb set ft=chef syntax=ruby
autocmd BufNewFile,BufRead */attributes/*.rb set ft=chef syntax=ruby
autocmd BufNewFile,BufRead metadata.rb set ft=chef syntax=ruby

autocmd BufRead,BufNewFile,FileType chef call SetYamlOptions()

"----------------- url encode/decode ------------------------------
" encode the selected text by the python script
function! Encode()
    let l:cmd = "python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.stdin.read(),safe=\"\"), end=\"\")'"
    " get the selected text
    let l:selected_text = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]

    let l:encoded = system(l:cmd, l:selected_text)

    " put back the encoded to the selected text with substitute
    execute "normal! gv\"_c" . l:encoded

endfunction

" decode the selected text by the python script
function! Decode()
    let l:cmd = "python3 -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.stdin.read()), end=\"\")'"
    " get the selected text
    let l:selected_text = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]

    let l:decoded = system(l:cmd, l:selected_text)

    " put back the decoded to the selected text with substitute
    execute "normal! gv\"_c" . l:decoded

endfunction

" map the key to encode the selected text
vmap <leader>en :call Encode()<CR>
" map the key to decode the selected text
vmap <leader>de :call Decode()<CR>
