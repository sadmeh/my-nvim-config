
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'

" Javascript and typescript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" color scheme and theme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

Plug 'kdheepak/lazygit.nvim'

Plug 'puremourning/vimspector'

Plug 'liuchengxu/vim-which-key' 

let g:coc_global_extensions = ['coc-json', 'sqlfluff', 'coc-git', 'coc-prettier', 'coc-eslint', 'coc-emmet', 'coc-dot-complete', 'coc-tsserver', 'coc-java', 'coc-java-debug']
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
