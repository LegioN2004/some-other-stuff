---@type MappingsTable
local M = {}

M.general = {
  --  n = {
  --    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  --  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>du"] = { function() require("dapui").toggle({}) end, desc = "Dap UI", },
          [ "<leader>de"] = { function() require("dapui").eval() end,     desc = "Eval",   mode = { "n", "v" }, },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>dB"] = {
      function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      "Breakpoint Condition"
    },
    ["<leader>db"] = {
      function() require("dap").toggle_breakpoint() end,
      "Toggle Breakpoint"
    },
    ["<leader>dc"] = {
      function() require("dap").continue() end,
      desc =
        "Continue"
    },
    ["<leader>dl"] = {
      function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      desc =
        "Set Log Point"
    },
    ["<leader>dC"] = {
      function() require("dap").run_to_cursor() end,
      desc =
        "Run to Cursor"
    },
    ["<leader>dg"] = {
      function() require("dap").goto_() end,
      desc =
        "Go to line (no execute)"
    },
    ["<leader>di"] = {
      function() require("dap").step_into() end,
      desc =
        "Step Into"
    },
    ["<leader>dj"] = {
      function() require("dap").down() end,
      desc =
        "Down"
    },
    ["<leader>dk"] = {
      function() require("dap").up() end,
      desc =
        "Up"
    },
    ["<leader>do"] = {
      function() require("dap").step_out() end,
      desc =
        "Step Out"
    },
    ["<leader>dO"] = {
      function() require("dap").step_over() end,
      desc =
        "Step Over"
    },
    ["<leader>dp"] = {
      function() require("dap").pause() end,
      desc =
        "Pause"
    },
    ["<leader>dr"] = {
      function() require("dap").repl.toggle() end,
      desc =
        "Toggle REPL"
    },
    ["<leader>ds"] = {
      function() require("dap").session() end,
      desc =
        "Session"
    },
    ["<leader>dt"] = {
      function() require("dap").terminate() end,
      desc =
        "Terminate"
    },
    ["<leader>dw"] = {
      function() require("dap.ui.widgets").hover() end,
      desc =
        "Widgets"
    },
    ["<leader>dR"] = {
      function() require("dap").clear_breakpoints() end,
      desc =
        "Removes all breakpoints"
    },
    ["<leader>dpr"] = {
      function() require('dap-python').test_method() end,
      desc =
        "loads the dap-python plugins and calls the test method function"
    },
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go tests"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}


-- Shorten function name
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "ts", ":so<CR>", opts)

--splitting windows
vim.keymap.set('n', 'sv', '<c-w>v', { silent = true })
vim.keymap.set('n', 'sh', '<c-w>s', { silent = true })
vim.keymap.set('n', 'sx', ':close<cr>', { silent = true })

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<Return><C-w>w", opts)

--tab movement
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<S-tab>", ":tabprevious<Return>", opts)

--tab movement
keymap("n", "<leader><tab>", ":bnext<Return>", opts)
keymap("n", "<leader><S-tab>", ":bprevious<Return>", opts)
-- keymap("n", "bn", ":bnext<Return>", opts)
-- keymap("n", "bp", ":bprevious<Return>", opts)
-- keymap("n", "bd", ":bdelete<Return>", opts)

--better movement between splits

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Paste from clipboard.
-- vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
-- vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
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

-- add new folders as tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word on which the cursor is sitting for the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
------------------------------------------------------------------

-- shortcuts for commenting
-- vim.keymap.set('n', "<leader>/", ":Commentary<cr>")
-- vim.keymap.set('v', "<leader>/", ":Commentary<cr>")

-- undotree keymaps
vim.keymap.set('n', "<leader>un", ":UndotreeToggle<cr>")

-- maximizer keymap
vim.keymap.set('n', "<leader>mt", ":MaximizerToggle<cr>")

-- open init.lua file
vim.keymap.set('n', "<leader>my", ":e $MYVIMRC<cr>")

vim.cmd([[
        "fzf keybindings
        nnoremap <silent> <leader>fzf :FZF ~<cr>
        nnoremap <silent> <leader>fr :History<CR>
        nnoremap <silent> <leader>ff :e %:h/<C-d>
        nnoremap <silent> <leader>fi :FZF /home/sunny/ghq/github.com/legion2004/programs/ <cr>
        nnoremap <silent> <leader>dot :FZF /home/sunny/dotfiles/ <cr>
        "open files from the home folder
        "nnoremap <silent> <leader>hot :FZF~ <cr>

        "better tabbing
        vnoremap < <gv
        vnoremap > >gv

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

        nnoremap ;f <Esc>:Lex<CR>:vertical resize 30<CR><CR>
        " nnoremap <leader>ex <Esc>:Ex<CR>
        let g:netrw_liststyle = 3
        let g:netrw_banner=0        " disable annoying banner

        " NvimTreeToggle remap
        " nnoremap ;f <Esc>:NvimTreeToggle<CR>:vertical resize 30<CR><CR>

        "checkout and fix these fzf keybinds
        " PLUGIN: FZF
        "nnoremap <silent> <Leader>b :Buffers<CR>
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

        " for fish use this to use fzf :set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
        " for bash/zsh use this export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
        " and remove the upper lines

        command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
        \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
        \   <bang>0)
        ]])

-- local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>te', ":Telescope<CR>")
-- vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

-- more keybinds!

return M
