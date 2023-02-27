-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--increment / decrement
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
-- select all text at once
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- -- keybinds for easier saving and quitting
keymap("n", "tw", ":w!<CR>", opts)
keymap("n", "tq", ":q!<CR>", opts)
keymap("n", "tqa", ":qa!<CR>", opts)
keymap("n", "twq", ":wq!<CR>", opts)
keymap("n", "ts", ":so ~/.config/nvim/init.lua", opts)

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<Return><C-w>w", opts)
-- keymap("n", "te", ":tabedit<cr>", opts), { silent = true })

--splitting windows
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sh", "<C-w>s", { silent = true })
vim.keymap.set("n", "sx", ":close<CR>", { silent = true })

--tab movement
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<S-tab>", ":tabprevious<Return>", opts)

--move window
-- vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set("", "s<left>", "<C-w>h")
vim.keymap.set("", "s<up>", "<C-w>k")
vim.keymap.set("", "s<down>", "<C-w>j")
vim.keymap.set("", "s<right>", "<C-w>l")
vim.keymap.set("", "s<right>", "<C-w>l")

--better movement between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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
nnoremap <leader>mk :mksession ~/nvimfiles/sessions/
nnoremap <leader>so :so ~/nvimfiles/sessions/

"xolox-vim-sessions management
let g:session_directory = "~/nvimfiles/xolox-vim-sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

""nnoremap ;f <Esc>:Lex<CR>:vertical resize 30<CR><CR>
""nnoremap <leader>ex <Esc>:Ex<CR>
""let g:netrw_liststyle = 3
" NvimTreeToggle remap
 nnoremap ;f <Esc>:NvimTreeToggle<CR>:vertical resize 30<CR><CR>

]])

-- from ThePrimeagen ------------------------------------------

-- best remap from the ThePrimeagen thanks brudda
-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("v", "<leader>d", '"_d')

-- half page up/down with centered view
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- searching forward or back with half page up/down
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

------------------------------------------------------------------
--
-- shortcuts for commenting
vim.keymap.set("n", "<C-/>", vim.cmd.Commentary)
vim.keymap.set("v", "<C-/>", vim.cmd.Commentary)

-- undotree keymaps
vim.keymap.set("n", "<leader>un", ":UndotreeToggle<CR>")

-- maximizer keymap
vim.keymap.set("n", "<leader>mt", ":MaximizerToggle<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>te", ":Telescope<CR>")
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
