nnoremap <SPACE> <Nop> 
let mapleader=" "
syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set spell spelllang=en_us
set clipboard=unnamed

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'liuchengxu/vim-which-key'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
