echom "Extra configuration for uing as ide"

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

let g:which_key_map.f = {
		\ 'name': '+find',
		\ 'f': ['find files'  , 'Telescope find_files'],
		\ 'g': ['live grep'   , 'Telescope live_grep' ],
		\ 'b': ['buffers'     , 'Telescope buffers'   ],
		\ 'h': ['help tags'   , 'Telescope help_tags' ],
		\}
	
