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
		cmd = { "MaximizerToggle" },
		keys = {
			{ "<leader>mt", ":MaximizerToggle<CR>", desc = "Toggle file tree" },
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
    "tpope/vim-rhubarb",
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
  "LazyVim/LazyVim",
  -- { "tpope/vim-surround",       lazy = true },
	
	--note taking org stuff
	-- {'nvim-orgmode/orgmode'},
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
	-- screensaver if you want to use
	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
	},
	--movement stuff
	-- use 'justinmk/vim-sneak'
	-- use 'phaazon/hop.nvim'
	-- session stuff
	-- use 'xolox/vim-session'
	-- use 'xolox/vim-misc'
	--language specific stuff
}
