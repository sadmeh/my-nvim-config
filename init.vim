let mapleader=' '
let maplocalleader=','

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
set timeoutlen=500
set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set cmdheight=3
set updatetime=300
set shortmess+=c
set clipboard=unnamedplus
let test#strategy = "neovim"
filetype plugin on
" Some strategies clear the screen before executing the test command, 
" but you can disable this:
let g:test#preserve_screen = 1
let g:test#neovim#start_normal = 1 " If using neovim strategy
let g:test#basic#start_normal = 1 " If using basic strategy
noh
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

augroup folding
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" auto set line number relative
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
" }}}

" let g:startify_custom_header = [
"                         \'╭━┳━┳━━┳━┳━╮',
"                         \'┃┃┃┃┃╭╮┃┃┃┃┃',
"                         \'┃┃┃┃┃┣┫┃┃┃┃┃',
"                         \'╰┻━┻┻╯╰┻┻━┻╯',
"                         \]
" let g:startify_enable_special      = 0
" let g:startify_files_number        = 8
" let g:startify_relative_path       = 1
" let g:startify_change_to_dir       = 1
" let g:startify_update_oldfiles     = 1
" let g:startify_session_autoload    = 1
"  let g:startify_session_persistence = 1
" let NERDTreeHijackNetrw = 0
" autocmd VimEnter * Startify
" PLUGINS --------------------------------------------------------------------- {{{
call plug#begin()
Plug 'liuchengxu/vim-which-key'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kdheepak/lazygit.nvim'
Plug 'puremourning/vimspector'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'vim-test/vim-test'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
call plug#end()
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-vimlsp', 'coc-lua', 'coc-css', 'coc-emmet', 'coc-eslint', 'coc-java', 'coc-java-debug', 'coc-prettier', 'coc-html', 'coc-sh', 'coc-sql', 'coc-sqlfluff', 'coc-tsserver', 'coc-yaml', 'coc-xml', 'coc-gist', 'coc-highlight', 'coc-html-css-support', 'coc-styled-components', 'coc-htmlhint', 'coc-tabnine']

let g:vimspector_install_gadgets = [ 'java-language-server', 'debugger-for-chrome', 'vscode-node-debug2' ]
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
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
let g:which_key_map.v.e="edit"
nnoremap <leader>vs :source $MYVIMRC<cr>
let g:which_key_map.v.s="source"

" telescope key maps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope file_browser<cr>

let g:which_key_map.f = {
		\ 'name': '+find', 
		\'f': 'find files', 
		\'g': 'live grep', 
		\'b': 'buffers',
		\'h': 'help tags' 
		\}
" nerdtree key mappings
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nn :NERDTree<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>ns :NERDTreeFind<CR>
let g:which_key_map.n = {
		\ 'name': '+tree', 
		\'f': 'focus', 
		\'n': 'tree', 
		\'t': 'toggle',
		\'s': 'find' 
		\}
" lazygit key mappins
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:which_key_map.g = {"name":"+git"}
" COC key mappings ------- {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>lrn <Plug>(coc-rename)

" TODO: find a suitable key mappings for this
" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>las  <Plug>(coc-codeaction-selected)
nmap <leader>las  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>laa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>lqf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>lal  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:which_key_map.l={"name":"+coc"}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>
" }}}
" vimspector -------------------- {{{

let g:which_key_map.d={"name":"+debug"}
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

nmap <leader>ds :CocCommand java.debug.vimspector.start<CR>
" }}}
" }}}
map <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

" SCHEMES --------------------------------------------------------------------- {{{
colorscheme gruvbox
set background=dark
let g:airline_theme="gruvbox"
" }}}
call SourceIfExists($XDG_CONFIG_HOME . '/nvim/extra/init.vim')
lua require('init')
let g:nerd_preview_enabled = 0
let g:preview_last_buffer  = 0

function! NerdTreePreview()
  " Only on nerdtree window
  if (&ft ==# 'nerdtree')
    " Get filename
    let l:filename = substitute(getline("."), "^\\s\\+\\|\\s\\+$","","g")

    " Preview if it is not a folder
    let l:lastchar = strpart(l:filename, strlen(l:filename) - 1, 1)
    if (l:lastchar != "/" && strpart(l:filename, 0 ,2) != "..")

      let l:store_buffer_to_close = 1
      if (bufnr(l:filename) > 0)
        " Don't close if the buffer is already open
        let l:store_buffer_to_close = 0
      endif

      " Do preview
      execute "normal go"

      " Close previews buffer
      if (g:preview_last_buffer > 0)
        execute "bwipeout " . g:preview_last_buffer
        let g:preview_last_buffer = 0
      endif

      " Set last buffer to close it later
      if (l:store_buffer_to_close)
        let g:preview_last_buffer = bufnr(l:filename)
      endif
    endif
  elseif (g:preview_last_buffer > 0)
    " Close last previewed buffer
    let g:preview_last_buffer = 0
  endif
endfunction

function! NerdPreviewToggle()
  if (g:nerd_preview_enabled)
    let g:nerd_preview_enabled = 0
    augroup nerdpreview
      autocmd!
      augroup END
  else
    let g:nerd_preview_enabled = 1
    augroup nerdpreview
      autocmd!
      autocmd CursorMoved * nested call NerdTreePreview()
    augroup END
  endif
endfunction
