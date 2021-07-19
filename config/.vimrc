set nocompatible
set autoindent
filetype off
set noswapfile
syntax on
syntax enable
filetype plugin indent on
set modelines=0
set number
set encoding=utf-8
set wrap
set linebreak
set nolist
set textwidth=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=2
set softtabstop=4
set expandtab
set noshiftround
set scrolloff=3
set backspace=indent,eol,start
runtime! macros/matchit.vim
set laststatus=2
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>
map <leader>q gqip
set linebreak
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme slate
map <C-k> :pyf /bb/bigstorq4/scrpbuild/devtools/bin/clang-format.py<CR>
imap <C-k> <ESC>:pyf /bb/bigstorq4/scrpbuild/devtools/bin/clang-format.    py<CR>i
inoremap jj <Esc>
