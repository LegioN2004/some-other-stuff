local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap -- for the keymap vim.keymap.set use keymap and single quotes only for the specifying key

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
-- Press qq fast to exit insert mode
keymap("i", "qq", "<ESC>", opts)

--dont yank  with x
vim.keymap.set('n', 'x', '"_x')

--increment / decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- delete a word backwords
-- vim.keymap.set('n', '<C-w>', 'vb"_d')
-- vim.keymap.set('n', 'dw', 'vb"_d')

-- select all text at once
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')


-- -- keybinds for easier saving and quitting
keymap("n", "tw", ":w!<CR>", opts)
keymap("n", "tq", ":q!<CR>", opts)
keymap("n", "tqa", ":qa!<CR>", opts)
keymap("n", "twq", ":wq!<CR>", opts)
keymap("n", "ts", ":so%<CR>", opts)

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<Return><C-w>w", opts)
-- keymap("n", "te", ":tabedit<cr>", opts), { silent = true })

--splitting windows
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sh', '<C-w>s', { silent = true })
vim.keymap.set('n', 'sx', ':close<CR>', { silent = true })

--tab movement
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<S-tab>", ":tabprevious<Return>", opts)

--move window
-- vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('', 's<left>', '<C-w>h')
vim.keymap.set('', 's<up>', '<C-w>k')
vim.keymap.set('', 's<down>', '<C-w>j')
vim.keymap.set('', 's<right>', '<C-w>l')
vim.keymap.set('', 's<right>', '<C-w>l')

--better movement between splits
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

vim.cmd([[
"fzf keybindings
nnoremap <silent> <leader>fzf :FZF ~<cr>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>ff :e %:h/<C-d>
nnoremap <silent> <leader>fi :FZF /home/sunny/ghq/github.com/legion2004/programs/ <cr>
nnoremap <silent> <leader>dot :FZF /home/sunny/dotfiles/ <cr>

"toggle fugitive
nnoremap <leader>gs :Git<CR>

"sessions management
nnoremap <leader>mk :mksession ~/.nvim/sessions/
nnoremap <leader>so :so ~/.nvim/sessions/

"xolox-vim-sessions management
let g:session_directory = "~/nvimfiles/xolox-vim-sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap ;f <Esc>:Lex<CR>:vertical resize 30<CR><CR>
let g:netrw_liststyle = 3
]])

-- from ThePrimeagen ------------------------------------------

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

-- half page up/down with centered view
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "<C-d>", "<C-d>zz")

-- searching forward or back with half page up/down
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "nzzzv")

------------------------------------------------------------------
--
-- shortcuts for commenting
vim.keymap.set('n', "<leader>/", vim.cmd.Commentary)
vim.keymap.set('v', "<leader>/", vim.cmd.Commentary)

-- undotree keymaps
vim.keymap.set('n', "<leader>un", ":UndotreeToggle<CR>")

-- maximizer keymap
vim.keymap.set('n', "<leader>mt", ":MaximizerToggle<CR>")

-- nvim tree toggle
-- vim.keymap.set('n', ";f", vim.cmd.Lex)

-- open files from home folder
-- vim.keymap.set('n', "<leader>f", ":FZF~")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>te', ":Telescope<CR>")
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
