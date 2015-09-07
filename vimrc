set textwidth=0 ts=4 sw=2 cindent autoindent smarttab expandtab backspace=indent,eol,start
set number                      " enable line numbers
set nocompatible                " be iMproved
set nowrap                      " disable automatic visual line wrapping
set noswapfile                  " disable swap file
set mouse=a                     " enable mouse scrolling in terminal
set cursorline
set ruler
set laststatus=2
set tabstop=4

set exrc                        " enable per-directory .vimrc files
set secure                      " disable unsafe commands in local .vimrc files

" OMG tab lists out options
set wildmenu
set wildmode=longest:full,full
set spell

let mapleader=","
nnoremap <leader>p :CtrlP<CR>
nmap <space><space> :w<cr>
set spelllang=en_us
map <F1> :set spell!<CR>:set spell?<CR>

syntax on
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required for Vundle!
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'scroloose/nerdcommenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-haml'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'saikobee/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'sukima/xmledit'

call vundle#end()
filetype plugin indent on "required for Vundle


set term=xterm-256color
colorscheme molokai
set guifont=Monaco:h13
"set transparency=70

set foldmethod=indent
set foldcolumn=6

"Ignore files for CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|.bower\|static/dst\|static/dev\|.pyc'
function! ToggleColorColumn()
    if &colorcolumn
        set colorcolumn=
    else
        set colorcolumn=78
    endif
endfunction
 
vnoremap > ><CR>gv
vnoremap < <<CR>gv

map <Leader>l :call ToggleColorColumn()<CR>
map <Leader>n :NERDTreeToggle<CR>

" Ignore CamelCase words when spell checking
fun! IgnoreCamelCaseSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()
