return {

  --	{
  --			"xiyaowong/transparent.nvim",
  --			lazy = false,
  --			config = function()
  --			require("transparent").setup {
  --			}
  --			end
  --	},

  ------ ui for nvim-lsp progress ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "meter",
        },
        window = {
          blend = 0, -- set 0 if using transparent background, otherwise set 100
        },
      })
    end,
  },

  ------ Neovim plugin to improve the default vim.ui interfaces ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- {
  --   "stevearc/dressing.nvim",
  --   event = "BufEnter",
  --   config = function()
  --     require("dressing").setup({
  --       input = {
  --         -- Set to false to disable the vim.ui.input implementation
  --         enabled = true,
  --         -- Default prompt string
  --         default_prompt = "Input:",
  --         -- Can be 'left', 'right', or 'center'
  --         title_pos = "left",
  --         -- When true, <Esc> will close the modal
  --         insert_only = true,
  --         -- When true, input will start in insert mode.
  --         start_in_insert = true,
  --         -- These are passed to nvim_open_win
  --         anchor = "SW",
  --         border = "rounded",
  --         -- 'editor' and 'win' will default to being centered
  --         relative = "cursor",
  --         -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --         prefer_width = 50,
  --         width = nil,
  --         -- min_width and max_width can be a list of mixed types.
  --         -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
  --         max_width = { 140, 0.9 },
  --         min_width = { 20, 0.2 },
  --         buf_options = {},
  --         win_options = {
  --           -- Window transparency (0-100)
  --           winblend = 0,
  --           -- Disable line wrapping
  --           wrap = false,
  --           -- Indicator for when text exceeds window
  --           list = true,
  --           listchars = "precedes:…,extends:…",
  --           -- Increase this for more context when text scrolls off the window
  --           sidescrolloff = 0,
  --         },
  --         -- Set to `false` to disable
  --         mappings = {
  --           n = {
  --             ["<Esc>"] = "Close",
  --             ["<CR>"] = "Confirm",
  --           },
  --           i = {
  --             ["<Esc>"] = "Close",
  --             ["<CR>"] = "Confirm",
  --             ["<Up>"] = "HistoryPrev",
  --             ["<Down>"] = "HistoryNext",
  --           },
  --         },
  --         override = function(conf)
  --           -- This is the config that will be passed to nvim_open_win.
  --           -- Change values here to customize the layout
  --           return conf
  --         end,
  --         -- see :help dressing_get_config
  --         get_config = nil,
  --       },
  --       select = {
  --         -- Set to false to disable the vim.ui.select implementation
  --         enabled = true,
  --         -- Priority list of preferred vim.select implementations
  --         backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
  --         -- Trim trailing `:` from prompt
  --         trim_prompt = true,
  --         -- Options for telescope selector
  --         -- These are passed into the telescope picker directly. Can be used like:
  --         -- telescope = require('telescope.themes').get_ivy({...})
  --         telescope = nil,
  --         -- Options for fzf selector
  --         fzf = {
  --           window = {
  --             width = 0.5,
  --             height = 0.4,
  --           },
  --         },
  --         -- Options for nui Menu
  --         nui = {
  --           position = "50%",
  --           size = nil,
  --           relative = "editor",
  --           border = {
  --             style = "rounded",
  --           },
  --           buf_options = {
  --             swapfile = false,
  --             filetype = "DressingSelect",
  --           },
  --           win_options = {
  --             winblend = 10,
  --           },
  --           max_width = 80,
  --           max_height = 40,
  --           min_width = 40,
  --           min_height = 10,
  --         },
  --         -- Options for built-in selector
  --         builtin = {
  --           -- These are passed to nvim_open_win
  --           anchor = "NW",
  --           border = "rounded",
  --           -- 'editor' and 'win' will default to being centered
  --           relative = "editor",
  --           buf_options = {},
  --           win_options = {
  --             -- Window transparency (0-100)
  --             winblend = 10,
  -- },
  --           -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --           -- the min_ and max_ options can be a list of mixed types.
  --           -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
  --           width = nil,
  --           max_width = { 140, 0.8 },
  --           min_width = { 40, 0.2 },
  --           height = nil,
  --           max_height = 0.9,
  --           min_height = { 10, 0.2 },
  --           -- Set to `false` to disable
  --           mappings = {
  --             ["<Esc>"] = "Close",
  --             ["<C-c>"] = "Close",
  --             ["<CR>"] = "Confirm",
  --           },
  --           override = function(conf)
  --             -- This is the config that will be passed to nvim_open_win.
  --             -- Change values here to customize the layout
  --             return conf
  --           end,
  --         },
  --         -- Used to override format_item. See :help dressing-format
  --         format_item_override = {},
  -- -- see :help dressing_get_config
  --         get_config = nil,
  --       },
  --     })
  --   end
  -- },

  -- easy dressing config
  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
    config = function()
      require("dressing").setup({
        input = {
          win_options = {
            winblend = 0,
          },
        },
      })
    end,
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        ft_ignore = { "neo-tree" },
        segments = {
          { sign = { name = { "Diagnostic" } } },
          { sign = { name = { "Dap.*" } } },
          { text = { builtin.lnumfunc },       click = "v:lua.ScLa" },
          { sign = { name = { "GitSigns.*" } } },
        },
      })
    end,
  },

  ---- comments ---------------------------------------------------------------------------------
  {
    "tpope/vim-commentary",
    event = "VeryLazy",
    cmd = "Commentary",
  },

  -- {
  -- 	"numToStr/Comment.nvim",
  -- 	config = function()
  -- 		require("Comment").setup()
  -- 	end,
  -- },
  ------ auto pairs for brackets braces etc ------------------------------------------------------
  -- {
  -- 	"jiangmiao/auto-pairs",
  -- 	event = "BufEnter",
  -- },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      --- setup for cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- lua library for neovim
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- folding
  -- {
  -- 	"kevinhwang91/nvim-ufo",
  -- 	dependencies = "kevinhwang91/promise-async",
  -- 	config = function()
  -- 		vim.o.foldcolumn = "0" -- '0' is not bad
  -- 		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  -- 		vim.o.foldlevelstart = 99
  -- 		vim.o.foldenable = true

  -- 		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  -- 		vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds)
  -- 		vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds)

  -- 		require("ufo").setup({
  -- 			provider_selector = function(bufnr, filetype, buftype)
  -- 				return { "treesitter", "indent" }
  -- 			end,
  -- 		})
  -- 	end,
  -- },

  -- auto detect indent
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({
        auto_cmd = true,               -- Set to false to disable automatic execution
        override_editorconfig = false, -- Set to true to override settings set by .editorconfig
        filetype_exclude = {           -- A list of filetypes for which the auto command gets disabled
          "netrw",
          "tutor",
          "nvim-tree",
          "alpha",
          "fugitive",
          "terminal",
        },
        buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
          "help",
          "nofile",
          "terminal",
          "prompt",
          "nvim-tree",
          "alpha",
          "fugitive",
        },
      })
    end,
  },

  ------ references ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  ------ indent guides for Neovim ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "nvim-tree", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  -------- neo-tree file explorer -----------------------------
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   cmd = "Neotree",
  --   keys = {
  --     {
  --       ";f",
  --       function()
  --         require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
  --       end,
  --       desc = "Explorer NeoTree (root dir)",
  --     },
  --     {
  --       ";F",
  --       function()
  --         require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  --       end,
  --       desc = "Explorer NeoTree (cwd)",
  --     },
  --     -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  --     -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  --   },
  --   deactivate = function()
  --     vim.cmd([[Neotree close]])
  --   end,
  --   init = function()
  --     vim.g.neo_tree_remove_legacy_commands = 1
  --     if vim.fn.argc() == 1 then
  --       local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --       if stat and stat.type == "directory" then
  --         require("neo-tree")
  --       end
  --     end
  --   end,
  --   opts = {
  --     filesystem = {
  --       bind_to_cwd = false,
  --       follow_current_file = true,
  --     },
  --     window = {
  --       mappings = {
  --         ["<space>"] = "none",
  --       },
  --     },
  --     default_component_configs = {
  --       indent = {
  --         with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
  --         expander_collapsed = "",
  --         expander_expanded = "",
  --         expander_highlight = "NeoTreeExpander",
  --       },
  --     },
  --   },
  -- },

  -- highilighted comments very good looking-----------------------------
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },

  ------limelight and goyo---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    "junegunn/limelight.vim",
    event = VeryLazy,
    cmd = "Limelight",
  },

  -- Distraction-free coding for Neovim
  {
    "folke/zen-mode.nvim",
    event = VeryLazy,
    cmd = "ZenMode",
    config = function()
      vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
    end,
  },
  -- git wrapper
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    config = function() end,
  },

  -- displays a popup with possible keybindings of the command
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.timeoutlen = 300
      require("which-key").setup({
        plugins = {
          presets = {
            g = false,
          },
        },
        window = {
          border = "single",
        },
      })
    end,
  },
  --------------- previously present stuff ------------------------------------------------------------------------------
  "goolord/alpha-nvim",
  "LazyVim/LazyVim",
  -- { "tpope/vim-surround",       lazy = true },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
      ft = { "markdown" }
    end,
  },

  {
    "ThePrimeagen/vim-be-good",
    event = VeryLazy,
    cmd = "VimBeGood",
  },

  {
    "mbbill/undotree",
    event = VeryLazy,
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
  },

  -- colorschemes
  { "gruvbox-community/gruvbox" },
  {
    "svrana/neosolarized.nvim",
    dependencies = "tjdevries/colorbuddy.nvim",
  },

  -- { 'junegunn/fzf',              lazy = true },
  -- { 'junegunn/fzf.vim',          lazy = true },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>spr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- Getting you where you want with the fewest keystrokes
  {
    "ThePrimeagen/harpoon",
    event = VeryLazy,
    cmd = "Harpoon",
    keys = {
      {
        "<leader>Ha",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        mode = "n",
        desc = "Harpoon Menu",
      },
      {
        "<leader>ad",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Harpoon Add File",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        mode = "n",
        desc = "Harpoon Nav File 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        mode = "n",
        desc = "Harpoon Nav File 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        mode = "n",
        desc = "Harpoon Nav File 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        mode = "n",
        desc = "Harpoon Nav File 4",
      },
    },
    config = function()
      vim.api.nvim_create_autocmd({ "Filetype" }, {
        pattern = "harpoon",
        callback = function()
          vim.opt.cursorline = true
          vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
          vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
        end,
      })
    end,
  },

  --- code folding -------------------------------------------------
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = "kevinhwang91/promise-async",
  --   config = function()
  --     vim.o.foldcolumn = "0" -- '0' is not bad
  --     vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true

  --     -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

  --     -- Adding number suffix of folded lines instead of the default ellipsis
  --     local handler = function(virtText, lnum, endLnum, width, truncate)
  --       local newVirtText = {}
  --       local suffix = ("  %d "):format(endLnum - lnum)
  --       local sufWidth = vim.fn.strdisplaywidth(suffix)
  --       local targetWidth = width - sufWidth
  --       local curWidth = 0
  --       for _, chunk in ipairs(virtText) do
  --         local chunkText = chunk[1]
  --         local chunkWidth = vim.fn.strdisplaywidth(chunkText)
  --         if targetWidth > curWidth + chunkWidth then
  --           table.insert(newVirtText, chunk)
  --           print(vim.inspect(chunk))
  --         else
  --           chunkText = truncate(chunkText, targetWidth - curWidth)
  --           local hlGroup = chunk[2]
  --           table.insert(newVirtText, { chunkText, hlGroup })
  --           chunkWidth = vim.fn.strdisplaywidth(chunkText)
  --           -- str width returned from truncate() may less than 2nd argument, need padding
  --           if curWidth + chunkWidth < targetWidth then
  --             suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
  --           end
  --           break
  --         end
  --         curWidth = curWidth + chunkWidth
  --       end
  --       table.insert(newVirtText, { suffix, "MoreMsg" })
  --       return newVirtText
  --     end

  --     require("ufo").setup({
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return { "treesitter", "indent" }
  --       end,
  --       fold_virt_text_handler = handler,
  --       open_fold_hl_timeout = 200,
  --     })
  --   end,
  -- },

  -- TODO -----------------------------------------------
  -- use this for some CSS stuff
  -- color highlighter
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "BufEnter",
  --   config = function()
  --     require("colorizer").setup({
  --       filetypes = { "*" },
  --       user_default_options = {
  --         names = false,
  --         tailwind = "both",
  --         mode = "background",
  --       },
  --     })
  --   end,
  -- },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufEnter",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
