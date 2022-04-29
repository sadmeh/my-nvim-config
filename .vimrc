let mapleader=' '
let maplocalleader='\\'

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

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

" vimrc editting
let g:which_key_map.v={"name":"+vimrc"}
nnoremap <leader>ve :split $MYVIMRC<cr>
let g:which_key_map.v.e="open"
nnoremap <leader>vs :source $MYVIMRC<cr>
let g:which_key_map.v.s="source"
" }}}

" SCHEMES --------------------------------------------------------------------- {{{
colorscheme gruvbox
set background=dark
" }}}
