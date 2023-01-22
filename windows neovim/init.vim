syntax on
set cindent
set smartindent
set titlestring=%t
set relativenumber
set noshowmode
set cmdheight=1
set smartcase
set ignorecase
set tabstop=4
set autoindent
set number
set hidden
set splitright
"set clipboard=unnamed,unnamedplus
set mouse=a
set guifont=Hack\ NF:h11:cANSI
set guicursor=" "
" GuiFont=Hack\ NF:h12:cANSI
set hls
set is
set sw=4
set si
set nowrap
set autoindent
set autowrite

" Always change the directory to working directory of file in current buffer
autocmd BufEnter * call CHANGE_CURR_DIR()
function! CHANGE_CURR_DIR()
	let _dir = expand("%:p:h")
	exec "cd " . _dir
	unlet _dir
endfunction

"---------------------------------------------------------------------------------------------------------------------------------------------
"some keybinds for convenience
let mapleader = " "
nmap tw :w!<cr>
nmap twq :wq!<cr>
nmap ts  :so %<cr>
nmap tqa :qa!<cr>
nnoremap tq :q!<cr>
nmap ts :so %<cr>
" vnoremap <C-c> "*y

"some windows keybinds
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap tn :tabnew<Return><C-w>w

"tab movement
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>
" nmap <leader> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sl <C-w>l
map sj <C-w>j
map sk <C-w>k

"for resizing windows 
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"cycle through tabs
nnoremap <C-Tab> <Tab>
nnoremap <C-S-Tab> <S-Tab>
"fzf keymaps
noremap <leader>fr :History<CR>
nnoremap fzf :FZF ~<CR>
nnoremap <leader>fi :FZF C:\Users\sunny\Downloads\dotfiles\LegioN2004-githubthings\programs<CR>
" nnoremap <leader>dot :FZF C:\Users\sunny\Downloads\dotfiles\LegioN2004-githubthings\dotfiles <CR>
nnoremap <leader>ff :FZF %:p:h<CR>
" toggle Telescope
nnoremap <leader>te :Telescope<CR>

" fix the telescope sht
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
" nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
" nnoremap <silent> \\ <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

"Plug-vim keybinds
nnoremap <leader>pi :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

"toggle maximizer
nnoremap <leader>sm :MaximizerToggle<CR>

"toggle undotree
nnoremap <leader>un :UndotreeToggle<CR>

"toggle fugitive
nnoremap <leader>gs :Git<CR>

"sessions management
nnoremap <leader>mk :mksession ~/.nvim/sessions/
nnoremap <leader>so :so ~/.nvim/sessions/

"xolox-vim-sessions management
let g:session_directory = "~/.nvim/xolox-vim-sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


" -- from ThePrimeagen ---------------------------------------------------------------------------------------------------------
" going up and down with cursor in the center of the buffer
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" netrw tree style
" nnoremap sf <Esc>:Lex<CR>:vertical resize 30<cr>
" fix the open in new tab from netrw
nnoremap <leader>e <Esc>:Lex<CR>:vertical resize 30<CR><CR>
let g:netrw_liststyle = 3

" nvim tree toggle
" nnoremap <leader>e :NvimTreeToggle<CR>

" neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=0.8
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	" let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
endif

"Plugins stuff
call plug#begin('C:/Users/sunny/AppData/Local/nvim-data/site/autoload')
call plug#end()

 colorscheme NeoSolarized
" colorscheme tokyonight
 hi Normal ctermbg=NONE guibg=NONE
 hi NormalNC ctermbg=NONE guibg=NONE

lua <<EOF
require('gitsigns').setup()
require('Telescope').setup()
require('toggleterm').setup ()
require('lualine').setup ({
options = {
	-- ... your lualine config
     ---from Devaslife---------------------------------------------------------------------------------------------------------------------------
	{ 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
	'encoding',
	'filetype',
	theme = 'auto',
}
})

vim.opt.list = false

-- from ThePrimeagen ---------------------------------------------------------------------------------------------------------

vim.opt.updatetime = 50
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

--vim.keymap.set('n', '<Tab>', 'tabn<CR>', {})
--vim.keymap.set('n', '<S-Tab>', 'tabp<CR>', {})

EOF

" coc things ------------------------------------------------------------------------------------------------------------------------------
"

inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
