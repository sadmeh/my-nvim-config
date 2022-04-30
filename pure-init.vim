call plug#begin()

" Declare the list of plugins.
Plug 'liuchengxu/vim-which-key'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set timeoutlen=500

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
