" Basic configs
set relativenumber
syntax on
set showcmd

nnoremap <leader>/ :set hlsearch!<cr>
set list listchars=precedes:<,extends:>,tab:\ \ ,trail:\ 
set nofixendofline
set backspace=indent,start
colorscheme industry
set hlsearch

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" Split position
set splitbelow
set splitright

" Change swapfolder location
set directory=$HOME/.vim/swap//

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
vnoremap <space> zf
