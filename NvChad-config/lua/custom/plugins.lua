local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
        -- lsp.default_keymaps({buffer = bufnr})
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>wfa", function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wfr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wfl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vcf", function() vim.lsp.buf.formatting() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>jca", "<cmd>lua require(\'jdtls\').code_action()<CR>", { silent = true })

        -- lspsaga stuff ------------------------------------------------------------------
        local keymap = vim.keymap.set
        keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>")
        -- It also supports tagstack
        -- Use <C-t> to jump back
        keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
        -- keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>")
        keymap("n", "<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>")
        keymap("n", "<leader>gpt", "<cmd>Lspsaga goto_type_definition<CR>")
        keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>")
        keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics ++keep<CR>")
        keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
        keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
        keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
        -- Diagnostic jump with filters such as only jumping to an error
        keymap("n", "[E", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end)
        keymap("n", "]E", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end)
        -- Toggle outline
        keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
        -- Call hierarchy
        keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
        keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
        -- Floating terminal
        keymap({ "n", "t" }, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>")
        -- lspsaga stuff ------------------------------------------------------------------
    end,
  },

  -- DAP stuff
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = " ",
            pause = " ",
            play = " ",
            run_last = " ",
            step_back = " ",
            step_into = " ",
            step_out = " ",
            step_over = " ",
            terminate = " ",
          },
        },
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
      require "custom.configs.dap"
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },

  -- python stuff
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/AppData/Local/nvim-data/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  -- go stuff
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap", },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },

  -- TODO: read the documentation of gopher.
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").setup("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end

  },

  -- rust stuff
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    -- build = "sudo pacman -S lldb"
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require "plugins.configs.cmp"
  --     M.completion.completeopt = "menu,menuone,noselect"
  --     M.mapping["<CR>"] = cmp.mapping.confirm {
  --       behavior = cmp.ConfirmBehavior.Insert,
  --       select = false,
  --     }
  --     table.insert(M.sources, {name = "crates"})
  --     return M
  --   end,
  -- },

  -- web-dev
  -- TODO: uncomment the following when null-ls formatting and other lsp stuff stops working
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end
  -- },


  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- neovim/lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-ls",
        -- "prettierd",
        "prettier",
        -- "deno",
        "eslint-lsp",
        "js-debug-adapter",

        -- c/cpp stuff
        "clangd",
        "clang-format",
        "codelldb",

        -- python stuff
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",

        -- rust stuff
        "rust-analyzer",

        -- go stuff
        "gopls",
        "delve", -- install this with the go install command
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	-- version = false,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim", -- FZF algorithm for telescope
			build =
			"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			config = function()
				require("telescope").load_extension("fzf")
			end,
			-- "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},

		-- A telescope extension to view and search your undo tree
		{
			"debugloop/telescope-undo.nvim",
			cmd = "Telescope undo",
			keys = {
				{ "<leader>tu", ":Telescope undo<CR>", desc = "Toggle Telescope version of undo tree" },
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("telescope").setup({
					extensions = {
						undo = {
							-- telescope-undo.nvim config, see below
						},
					},
				})
				require("telescope").load_extension("undo")
				vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>")
			end,
		},

		-- ui for telescope and some other related plugins
		{
			"nvim-lua/plenary.nvim",
			lazy = true,
		},
		{ 'nvim-lua/popup.nvim' },

		{
			"folke/trouble.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			lazy = true,
		},
	},

	-- BUG: change the find_command i.e the stuff inside the function brackets if there are any performance related issues or stuff breaking or some unusual stuff
	-- I added fd , rg here to make the find_files and grep_string process faster as they use rust instead of traditional vimscript
	keys = {
		{ "<leader>te", ":Telescope<CR>", desc = "Toggle Telescope" },
		{
			"<leader>ps",
			function()
				require("telescope.builtin").grep_string({
					{ find_command = { 'rg', fname } },
					search = vim.fn.input("Grep > ")
				})
			end,
			desc = "Toggle Telescope grep",
		},
		{
			"<leader><space>",
			function()
				require("telescope.builtin").find_files({ find_command = { 'fd', fname } })
			end,
			desc = "Find file",
		},
		{
			";r",
			function()
				require("telescope.builtin").live_grep({ find_command = { 'rg', fname } })
			end,
			desc = "Grep directory",
		},
		{
			"<leader>?",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ find_command = { 'rg', fname } })
			end,
			desc = "Grep current buffer",
		},
		{
			"<leader>;",
			function()
				require("telescope.builtin").command_history()
			end,
			desc = "Command history",
		},
		{
			"<leader>:",
			function()
				require("telescope.builtin").commands({ find_command = { 'rg', fname } })
			end,
			desc = "Commands",
		},
		-- {
		-- 	"<leader>r",
		-- 	function()
		-- 		require("telescope.builtin").resume()
		-- 	end,
		-- 	desc = "Resume telescope",
		-- },
		{
			"<leader>bb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffer",
		},
		{
			"<leader>cs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Symbols in document",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles({ find_command = { 'fd', fname } })
			end,
			desc = "Find previously opened file",
		},
		{
			"<leader>km",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find the user defined keymaps",
		},
		-- {
		-- 	"<leader>fF",
		-- 	function()
		-- 		require("telescope").extensions.file_browser.file_browser({
		-- 			hidden = true,
		-- 			grouped = true,
		-- 			initial_mode = "normal",
		-- 		})
		-- 	end,
		-- 	desc = "Browse files",
		-- },
		{
			";h",
			function()
				require("telescope.builtin").help_tags({ find_command = { 'rg', fname } })
			end,
			desc = "NeoVim help tags",
		},
	},
	config = function()
		local telescope = require("telescope")
		local telescope_config = require("telescope.config")
		local actions = require("telescope.actions")

		-- -- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

		-- -- I want to search in hidden/dot files.
		-- -- table "--hidden")
		-- -- -- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!.git/*")

		local trouble = require("trouble.providers.telescope")
		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				-- vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<c-n>"] = actions.move_selection_next,
						["<c-p>"] = actions.move_selection_previous,
						["<c-t>"] = trouble.open_with_trouble,
						["<esc>"] = actions.close, -- Close on first press of esc. No "normal" mode.
					},
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
				-- Themeing
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
				},
			},
		})
	end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
