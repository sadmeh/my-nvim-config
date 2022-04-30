syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set spell spelllang=en_us
set clipboard=unnamed
" By default timeoutlen is 1000 ms
set timeoutlen=500
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymaps.vim

colorscheme gruvbox
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
