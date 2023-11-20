-- TODO: fix the notifications using nvim-notify & fix the whichkey with correct all the bindings that have been setup & setup debugger for the languages &
-- fix the nvim tree transparency and in other places necessary
return {
  "goolord/alpha-nvim",
  {
    'rose-pine/neovim',
    config = function()
      opts = {
        disable_italics = true,
      }
    end
  },
  -- faster file search alternative to fzf and telescope ; trigger using ctrl + f
  {
    "jake-stewart/jfind.nvim",
    keys = {
      { "<c-f>" },
    },
    config = function()
      require("jfind").setup({
        exclude = {
          ".git",
          ".idea",
          ".vscode",
          ".sass-cache",
          ".class",
          "__pycache__",
          "node_modules",
          "target",
          "build",
          "tmp",
          "assets",
          "dist",
          "public",
          "*.iml",
          "*.meta"
        },
        border = "rounded",
        tmux = true,
        key = "<c-f>"
      });
    end
  },
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

  {
    "szw/vim-maximizer",
    lazy = true,
    keys = {
      { "<leader>mt", ":MaximizerToggle<CR>", desc = "maximize a split" },
    },
    config = function()
      vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup {
      }
    end
  },

  ------ ui for nvim-lsp progress ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        window = {
          blend = 0, -- set 0 if using transparent background, otherwise set 100
        },
      })
    end,
  },

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
      local status, autopairs = pcall(require, 'nvim-autopairs')
      if (not status) then return end
      autopairs.setup {
        disable_filetypes = { 'TelescopePrompt', 'vim' }
      }
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
  -- highilighted comments very good looking-----------------------------
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
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
    dependencies = { "tpope/vim-rhubarb" },
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
  "LazyVim/LazyVim",
  -- { "tpope/vim-surround",       lazy = true },

  --note taking org stuff
  -- {'nvim-orgmode/orgmode'},
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    ft = { "markdown" },
    -- setup = function()
    --   vim.g.mkdp_filetypes = { "markdown" }
    -- end,
  },

  {
    "ThePrimeagen/vim-be-good",
    event = VeryLazy,
    cmd = "VimBeGood",
  },

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },

  {
    "mbbill/undotree",
    event = VeryLazy,
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
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

  -- NOTE: -----------------------------------------------
  -- use this for some CSS stuff
  -- color highlighter
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufEnter",
    ft = { "css" },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          names = false,
          tailwind = "both",
          mode = "background",
        },
      })
    end,
  },

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
  -- screensaver if you want to use
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  --movement stuff
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  -- use 'justinmk/vim-sneak'
  -- use 'phaazon/hop.nvim'
  -- session stuff
  -- use 'xolox/vim-session'
  -- use 'xolox/vim-misc'
  --language specific stuff
}
