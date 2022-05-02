set nocompatible
set noshowmode
set encoding=UTF-8
set shell=zsh
filetype plugin indent on
filetype indent on

" Map leader key for extra combinations
let mapleader=" "

" Set colorscheme
colorscheme gruvbox
set background=dark

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set rtp+=/opt/homebrew/bin/fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocommands START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off paste mode when leaving insert
" autocmd InsertLeave * set nopaste

" Disable autocomments
" autocmd BufEnter * set fo-=c fo-=r fo-=o
" autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
" autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro

" Open help windows in vertical orientation
" autocmd! FileType help :wincmd L | :vert resize 100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocommands END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Basic Configuration START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set go-=L
set t_Co=256
set nuw=5
set incsearch
set showcmd
set number
set relativenumber
set nu rnu
set mouse=a
set nowrap
set smartcase
set ignorecase
set tabstop=4 softtabstop=4
set shiftwidth=4
set cursorline
set expandtab
set smartindent
set signcolumn=yes:1
set novisualbell
set noerrorbells
set autochdir
set termguicolors
set nohlsearch
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set cmdheight=1
set autoindent
set wildmenu
set guicursor=i:block
set so=999
set foldmethod=manual
set foldenable
set splitbelow splitright  " Set default split direction for new split windows
set hidden 
set updatetime=1000
set shortmess+=c
set emoji

" Exit insert mode faster
imap jj <esc>

" Faster saves
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

" source current file
nnoremap <leader>s :so %<cr>

" Split windows
nnoremap <C-w>l :vsplit<cr>
nnoremap <C-w>j :split<cr>

" Move between split windows
nnoremap <C-l> <C-w>l<cr>
nnoremap <C-k> <C-w>k<cr>
nnoremap <C-j> <C-w>j<cr>
nnoremap <C-h> <C-w>h<cr>

