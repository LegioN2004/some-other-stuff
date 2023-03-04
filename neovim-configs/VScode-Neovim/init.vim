filetype indent on
set nocompatible
set t_Co=256
set encoding=UTF-8
set termguicolors
set splitright
set wildmenu
set showmatch
set relativenumber
set nohlsearch
set noshowmode
set novisualbell
set noerrorbells
set vb t_vb=
set belloff=all
set noerrorbells
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set tabstop=4              " Number of spaces tab is counted for.
set backspace=2            " Fix backspace behavior on most terminals.
set expandtab
set autoindent             " Respect indentation when starting a new line.
set smartindent
set nowrap
set nu
set smartcase
set swapfile
set backup
set undofile
set directory=~/nvimfiles/swap//
set backupdir=~/nvimfiles/backup//
set undodir=~/nvimfiles/undo//
set incsearch
set hlsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set is 
set si 
let g:split_term_style = 'vertical'

"------------------------------------------------------------------------------------
"from here the mapping style is the same as in the vimrc and other init.vim and keymaps.lua
"some keybinds for convenience

"dont yank  with x
"vim.keymap.set('n', 'x', '"_x')
let mapleader = " "

nmap + <c-a>
nmap - <c-x>

nmap tw :w!<cr>
nmap twq :wq!<cr>
nmap ts  :so %<cr>
nmap tq :q!<cr>
nmap ts :so %<cr>
vnoremap <C-c> "*y

"some windows keybinds
nmap sh :hsplit<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap sx :close<cr>

nmap tn :tabnew<Return><C-w>w
"tab movement
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"for resizing windows 
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" going up and down with cursor in the center of the buffer
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv

let g:fff#split = "30vnew"

if has('win32')
  set rtp^=$HOME
endif

if exists('g:vscode')
" VSCode extension
else 
" ordinary neovim
endif


lua <<EOF
-- from ThePrimeagen ------------------------------------------
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
-- best remap from the ThePrimeagen thanks brudda
-- greatest remap ever
vim.keymap.set('x', "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

vim.keymap.set('v', "<leader>d", "\"_d")

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
------------------------------------------------------------------------------------
EOF
