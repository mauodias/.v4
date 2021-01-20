" Basic configs
set relativenumber
set number
syntax on
set showcmd
set laststatus=2
set cursorline

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

nnoremap <leader>/ :set hlsearch!<cr>
set list listchars=precedes:<,extends:>,tab:\ \ ,trail:\ 
set nofixendofline
set backspace=indent,start
colorscheme slate

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
