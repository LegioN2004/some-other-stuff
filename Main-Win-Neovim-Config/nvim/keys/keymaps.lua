local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap -- for the keymap vim.keymap.set use keymap and single quotes only for the specifying key

--"mapping style is the same as in the vimrc and other init.vim and .lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--dont yank  with x
--vim.keymap.set('n', 'x', '"_x')

--increment / decrement
vim.keymap.set('n', '+', '<c-a>')
vim.keymap.set('n', '-', '<c-x>')

-- delete a word backwords
-- vim.keymap.set('n', '<c-w>', 'vb"_d')
-- vim.keymap.set('n', 'dw', 'vb"_d')

-- select all text at once
vim.keymap.set('n', '<c-a>', 'gg<s-v>g')

-- keybinds for easier saving and quitting
keymap("n", "tw", ":w!<cr>", opts)
keymap("n", "tq", ":q!<cr>", opts)
keymap("n", "tqa", ":qa!<cr>", opts)
keymap("n", "twq", ":wq!<cr>", opts)
keymap("n", "ts", ":so%<cr>", opts)

--splitting windows
vim.keymap.set('n', 'sv', '<c-w>v', { silent = true })
vim.keymap.set('n', 'sh', '<c-w>s', { silent = true })
vim.keymap.set('n', 'sx', ':close<cr>', { silent = true })

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<return><c-w>w", opts)

--tab movement
keymap("n", "<tab>", ":tabnext<return>", opts)
keymap("n", "<s-tab>", ":tabprevious<return>", opts)

--Buffer movement
keymap("n", "<leader><tab>", ":bnext<return>", opts)
keymap("n", "<leader><s-tab>", ":bprevious<return>", opts)

--better movement between splits
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- resize with arrows
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)


-- from theprimeagen ------------------------------------------
-- best remap from the theprimeagen
-- greatest remap ever
vim.keymap.set('x', "<leader>p", "\"_dp")

-- next greatest remap ever : asbjornhaland
vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+y")

vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

-- half page up/down with centered view
vim.keymap.set('n', "<c-u>", "<c-u>zz")
vim.keymap.set('n', "<c-d>", "<c-d>zz")

-- searching forward or back with half page up/down
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "n", "nzzzv")
------------------------------------------------------------------

-- shortcuts for commenting
vim.keymap.set('n', "<leader>/", ":Commentary<cr>")
vim.keymap.set('v', "<leader>/", ":Commentary<cr>")

-- undotree keymaps
vim.keymap.set('n', "<leader>un", ":undotreetoggle<cr>")

-- maximizer keymap
vim.keymap.set('n', "<leader>mt", ":maximizertoggle<cr>")

vim.cmd([[
nnoremap <silent><leader>my :e ~/AppData/local/nvim/init.vim \| :source ~/AppData/local/nvim/init.vim <cr>
nnoremap <silent><leader>pi :e ~/AppData/local/nvim/vim-plug/plugins.vim \| :source ~/AppData/local/vim-plug/plugins.vim <cr> ""\| :PlugUpdate<cr>

"fzf keybindings
nnoremap <silent> <leader>fzf :FZF ~<cr>
nnoremap <silent> <leader>fr :history<cr>
nnoremap <silent> <leader>ff :e %:h/<c-d>
nnoremap <silent> <leader>fi :FZF ~/Documents/dotfiles/legion2004-githubthings/programs <cr>
nnoremap <silent> <leader>dot :FZF ~/Documents/dotfiles/legion2004-githubthings/dotfiles <cr>
"nnoremap <silent> <leader>~ :FZF ~ <cr>

"telescope sht
nnoremap <silent> <leader>te :Telescope<cr>

"better tabbing
vnoremap < <gv
vnoremap > >gv

"toggle fugitive
nnoremap <leader>gs :git<cr>

"sessions management
nnoremap <leader>mk :mksession ~/nvimfiles/sessions/
nnoremap <leader>so :so ~/nvimfiles/sessions/

"nnoremap ;f <esc>:Lex<cr>:vertical resize 30<cr><cr>
"nnoremap <leader>ex <esc>:ex<cr>
"let g:netrw_liststyle = 3
"let g:netrw_banner=0        " disable annoying banner

" NvimTreeToggle remap
nnoremap ;f <esc>:NvimTreeToggle<cr>:vertical resize 30<cr><cr>

"checkout these fzf keybinds
" PLUGIN: FZF
"nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
"nnoremap <silent> <Leader>rg :Rg<CR> "ripgrep grep lines
"nnoremap <silent> <Leader>ag :Ag<CR> "project finder
"nnoremap <silent> <Leader>/ :BLines<CR> "line finder
"nnoremap <silent> <Leader>/ :Lines<CR> "line finder
"nnoremap <silent> <Leader>' :Marks<CR> "marked files find
"nmap <Leader>t :BTags<CR>  "tag finder 
"nmap <Leader>T :Tags<CR>   "search for tags across project
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR> "help finder
"nnoremap <silent> <Leader>hh :History<CR> "history finder
"nnoremap <silent> <Leader>h: :History:<CR> "history finder
"nnoremap <silent> <Leader>h/ :History/<CR> "history finder
"nnoremap <silent> <Leader>h/ :Maps<CR> "mappings finder
"nnoremap <silent> <Leader>h/ :Commands<CR> "commands finder
"nnoremap <silent> <Leader>h/ :Filetypes<CR> "Filetypes finder

"set grep to ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

"$FZF_DEFAULT_OPTS:--no-height --no-reverse
]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>te', ":Telescope<CR>")
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
