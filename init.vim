let mapleader=' '
let maplocalleader='\\'

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" OPTIONS --------------------------------------------------------------------- {{{
set number
set tabstop=4
set scrolloff=4
set hlsearch
set incsearch
set ignorecase
set smartcase
augroup folding
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" PLUGINS --------------------------------------------------------------------- {{{
call plug#begin()
Plug 'liuchengxu/vim-which-key'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
" }}}

" KEYMAPS --------------------------------------------------------------------- {{{
inoremap jk <esc>

" which key mappings
let g:which_key_map =  {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" buffers
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['buffers'   , 'fzf-buffer']      ,
      \ }

" vimrc editting
let g:which_key_map.v={"name":"+vimrc"}
nnoremap <leader>vb :vsplit $MYVIMRC<cr>
let g:which_key_map.v.b="open base"
nnoremap <leader>ve :vsplit $XDG_CONFIG_HOME/nvim/extra/init.vim<cr>
let g:which_key_map.v.e="open extra"
nnoremap <leader>vs :source $MYVIMRC<cr>
let g:which_key_map.v.s="source"

" telescope key maps
let g:which_key_map.f = {
		\ 'name': '+find',
		\ 'f': ['find files'  , 'Telescope find_files'],
		\ 'g': ['live grep'   , 'Telescope live_grep' ],
		\ 'b': ['buffers'     , 'Telescope buffers'   ],
		\ 'h': ['help tags'   , 'Telescope help_tags' ],
		\}
" }}}
" SCHEMES --------------------------------------------------------------------- {{{
colorscheme gruvbox
set background=dark
" }}}

call SourceIfExists($XDG_CONFIG_HOME . '/nvim/extra/init.vim')
