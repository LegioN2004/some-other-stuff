local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap -- for the keymap vim.keymap.set use keymap and single quotes only for the specifying key

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--dont yank  with x
--vim.keymap.set('n', 'x', '"_x')

--increment / decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- delete a word backwords
-- vim.keymap.set('n', '<C-w>', 'vb"_d')
-- vim.keymap.set('n', 'dw', 'vb"_d')

-- select all text at once
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- -- keybinds for easier saving and quitting
keymap("n", "tw", ":w!<CR>", opts)
keymap("n", "tq", ":q!<CR>", opts)
keymap("n", "tqa", ":qa!<CR>", opts)
keymap("n", "twq", ":wq!<CR>", opts)
keymap("n", "ts", ":so<CR>", opts)

--splitting windows
vim.keymap.set("n", "sv", "<c-w>v", { silent = true })
vim.keymap.set("n", "ss", "<c-w>s", { silent = true })
vim.keymap.set("n", "sx", ":close<cr>", { silent = true })

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<Return><C-w>w", { silent = true })

--tab movement
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<S-tab>", ":tabprevious<Return>", opts)

--tab movement
keymap("n", "<leader><tab>", ":bnext<Return>", opts)
keymap("n", "<leader><S-tab>", ":bprevious<Return>", opts)
-- keymap("n", "bn", ":bnext<Return>", opts)
-- keymap("n", "bp", ":bprevious<Return>", opts)
-- keymap("n", "bd", ":bdelete<Return>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Paste from clipboard.
-- vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
-- vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- from ThePrimeagen ------------------------------------------
-- greatest remap ever
--[[if there is a need to preserve the current yanked text without storing the next deleted one(as it is stored 
after deletion) since it may be required so use this ]]
vim.keymap.set("x", "<leader>p", "\"_dP")

-- moving lines of code  up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Y", "yg$")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y") -- yank to the system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d") -- deleted stuff put into the void register of vim so that it doesn't clutter the current paste buffer
vim.keymap.set("v", "<leader>d", "\"_d") -- in visual_mode

-- half page up/down with centered view
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- searching forward or back with half page up/down
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace the word on which the cursor is sitting for the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

------------------------------------------------------------------

-- open init.lua file
vim.keymap.set("n", "<leader>my", ":e $MYVIMRC<cr>")

-- modify x to delete text without changing the internal registers.
vim.keymap.set({ "n", "x" }, "x", '"_x')

vim.cmd([[
"better tabbing
vnoremap < <gv
vnoremap > >gv

"sessions management
nnoremap <leader>mk :mksession ~/nvimfiles/sessions/
nnoremap <leader>so :so ~/nvimfiles/sessions/

]])
