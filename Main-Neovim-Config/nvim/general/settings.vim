" set the leader key
let g:mapleader = "\<Space>"

syntax enable
set hidden
set nowrap
set encoding=utf-8
set pumheight=10
set fileencoding=utf-8
set ruler
set cmdheight=2
set iskeyword+=-
set t_Co=256
set conceallevel=0
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=0
set number
set relativenumber
set cursorline
set background=dark
set showtabline=2
set noshowmode
set updatetime=50
set timeoutlen=100
set formatoptions-=cro
" set clipboard=unnamed, unnamedplus
" set autochdir
"auto source after write
au! BufWritePost $MYVIMRC source %

let s:coc_extensions = [
\   'coc-css',
\   'coc-sumneko-lua',
\   'coc-lightbulb',
\   'coc-clangd',
\   'coc-emmet',
\   'coc-prettier'
\ ]

"just to make those backup files in another directory so as to not make a mess
set swapfile
set backup
set undofile
set directory=~/nvimfiles/swap//
set backupdir=~/nvimfiles/backup//
set undodir=~/nvimfiles/undo//

set mouse=a

lua << EOF
vim.cmd('autocmd!')
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

EOF
