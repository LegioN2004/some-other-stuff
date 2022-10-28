set relativenumber
set cmdheight=1
set smartcase
set ignorecase
set tabstop=4
set autoindent
set number
set splitbelow
set splitright
set nowritebackup
set noswapfile
set nobackup
"set clipboard=unnamed,unnamedplus
set mouse=a
set guifont=Hack\ NF:h12:cANSI
" GuiFont=Hack\ NF:h12:cANSI
set hls
set is
set sw=4
set si
set nowrap

" colorscheme gruvbox
"make background transparent

" Always change the directory to working directory of file in current buffer
"
autocmd BufEnter * call CHANGE_CURR_DIR()
        function! CHANGE_CURR_DIR()
            let _dir = expand("%:p:h")
            exec "cd " . _dir
            unlet _dir
        endfunction

"some keybinds for convenience
let mapleader = " "
nmap tw :w!<cr>
nmap twq :wq!<cr>
nmap ts  :so %<cr>
nmap tq :q!<cr>
nmap ts :so %<cr>
vnoremap <C-c> "*y

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

"fzf keymaps
nnoremap <leader>fr :History<CR>
nnoremap <leader>ff :FZF ~<CR>
nnoremap <leader>fi :FZF ~/Downloads/dotfiles/programs/ <CR>
nnoremap <leader>dot :FZF ~/Downloads/dotfiles/dotfiles/ <CR>

"Plug-vim keybinds
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

"toggle maximizer
nnoremap <leader>sm :MaximizerToggle<CR>

"neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=0.8
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	" let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
endif

"Plugins
call plug#begin('C:/Users/sunny/AppData/Local/nvim-data/site/autoload')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'vim-syntastic/syntastic'
Plug 'overcache/NeoSolarized'
Plug 'gruvbox-community/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

colorscheme NeoSolarized
hi Normal ctermbg=NONE guibg=NONE
hi NormalNC ctermbg=NONE guibg=NONE

lua <<EOF
require('lualine').setup()
require('bufferline').setup()
vim.opt.list = true

-- from ThePrimeagen ------------------------------------------

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

--bufferline things

local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        mode = "tabs",
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        separator = {
            fg = '#073642',
            bg = '#002b36',
        },
        separator_selected = {
            fg = '#073642',
        },
        background = {
            fg = '#657b83',
            bg = '#002b36'
        },
        buffer_selected = {
            fg = '#fdf6e3',
            bold = true,
        },
        fill = {
            bg = '#073642'
        }
    },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
------------------------------------------------------------------------------------
EOF

" coc things ---------------------------------------------------------------
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

"" GoTo code navigation.


nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



