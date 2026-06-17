set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8
set hidden
set mouse=a
set clipboard=unnamedplus
set termguicolors

set number
set cursorline
set showmatch
set ruler
set signcolumn=yes
set scrolloff=8
set sidescrolloff=8
set wrap
set linebreak

set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nobackup
set nowritebackup
set noswapfile

set undofile
set undodir=~/.vim/undodir

set splitbelow
set splitright

set laststatus=2
set showcmd
set foldmethod=indent
set foldlevel=99

set wildmenu
set wildmode=longest:full,full
set completeopt=menu,menuone,noselect

let mapleader=" "

nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>

call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme codedark
