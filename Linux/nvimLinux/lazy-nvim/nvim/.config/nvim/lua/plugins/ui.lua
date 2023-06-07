return {

	------ git signs ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "▎" },
				delete = { text = "-" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>gsh", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>grh", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},

	------ lualine status bar as well as noice for getting a floating inbuilt cmd line in nvim ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		opts = function()
			local icons = require("lazyvim.config").icons
			local function fg(name)
				return function()
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "solarized_dark",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{
							"filename",
							symbols = {
								modified = "  ",
								readonly = "  ",
								unnamed = "  ",
								padding = { left = 0, right = 0 },
							},
						},
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fg("Special"),
						},
					},
					lualine_x = {
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function()
                return package.loaded["noice"] and
                    require("noice").api.status.command.has()
              end,
              color = fg("Statement")
            },
					},
					lualine_z = {
						-- function()
						-- 	return " " .. os.date("%r")
						-- end,
						{ "progress", padding = { left = 1, right = 1 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
				},
				extensions = { "fugitive", "neo-tree", "nvim-tree", "lazy" },
			}
		end,
	},

	--- noicer ui -------------------------------------------------------------------------
	-- {
	--   "folke/noice.nvim",
	--   event = "VeryLazy",
	--   dependencies = "MunifTanjim/nui.nvim",
	--   opts = {
	--     lsp = {
	--       { "config.lsp.hover.enabled" } == false,
	--       { "config.lsp.signature.enabled" } == false,
	--       override = {
	--         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--         ["vim.lsp.util.stylize_markdown"] = true,
	--         ["cmp.entry.get_documentation"] = true,
	--       },
	--       message = {
	--         -- Messages shown by lsp servers
	--         enabled = true,
	--         view = "notify",
	--         opts = {},
	--       },
	--       -- defaults for hover and signature help
	--       documentation = {
	--         view = "hover",
	--         opts = {
	--           lang = "markdown",
	--           replace = true,
	--           render = "plain",
	--           format = { "{message}" },
	--           win_options = { concealcursor = "n", conceallevel = 3 },
	--         },
	--       },
	--     },
	--     presets = {
	--       bottom_search = true,
	--       command_palette = true,
	--       long_message_to_split = true,
	--     },
	--   },
	--   -- stylua: ignore
	--   keys = {
	--     {
	--       "<S-Enter>",
	--       function() require("noice").redirect(vim.fn.getcmdline()) end,
	--       mode = "c",
	--       desc =
	--       "Redirect Cmdline"
	--     },
	--     {
	--       "<leader>snl",
	--       function() require("noice").cmd("last") end,
	--       desc =
	--       "Noice Last Message"
	--     },
	--     {
	--       "<leader>snh",
	--       function() require("noice").cmd("history") end,
	--       desc =
	--       "Noice History"
	--     },
	--     {
	--       "<leader>sna",
	--       function() require("noice").cmd("all") end,
	--       desc =
	--       "Noice All"
	--     },
	--     -- {
	--     -- 	"<c-f>",
	--     -- 	function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
	--     -- 	silent = true,
	--     -- 	expr = true,
	--     -- 	desc =
	--     -- 	"Scroll forward",
	--     -- 	mode = {
	--     -- 		"i", "n", "s" }
	--     -- },
	--     -- {
	--     -- 	"<c-b>",
	--     -- 	function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
	--     -- 	silent = true,
	--     -- 	expr = true,
	--     -- 	desc =
	--     -- 	"Scroll backward",
	--     -- 	mode = {
	--     -- 		"i", "n", "s" }
	--     -- },
	--   },
	-- },

	---- notifications when using nvim-notify
	{
		-- local started = false,
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>xn",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		config = function()
			vim.notify = function(msg, level, opts)
				require("notify").setup({
					background_colour = "#d79921",
					timeout = 3500,
					render = "minimal",
					stages = "static",
				})

				msg = vim.trim(msg)

				if msg ~= "" then
					local filename = vim.trim(vim.fn.expand("%:t"))

					if filename ~= "" then
						filename = filename .. ": "
					end

					msg = " " .. filename .. msg

					require("notify")(msg, level, opts)
				end
			end
		end,
		version = "*",
		event = "VeryLazy",
	},

	------ file browser ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"nvim-tree/nvim-tree.lua", -- File browser
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		config = function()
			local icons = require("config.icons").git
			require("nvim-tree").setup({
				on_attach = on_attach,
				sync_root_with_cwd = true,
				renderer = {
					highlight_opened_files = "name",
					indent_markers = {
						enable = true,
					},
					icons = {
						git_placement = "after",
						glyphs = {
							git = {
								unstaged = icons.FileUnstaged,
								staged = icons.FileStaged,
								unmerged = icons.FileUnmerged,
								renamed = icons.FileRenamed,
								untracked = icons.FileUntracked,
								deleted = icons.FileDeleted,
								ignored = icons.FileIgnored,
							},
						},
					},
				},
				hijack_netrw = true,
				filters = {
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
				},
				actions = { open_file = { quit_on_open = false } },
				update_focused_file = {
					enable = true,
				},
			})
		end,
	},

	------ floating terminal for better reach ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		event = VeryLazy,
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		-- keys = {
		-- 	{ "<C-\>", ":ToggleTerm<CR>", silent = true, desc = "Toggle terminal" },
		-- 	-- { "<leader>L", ":ToggleTermToggleAll<CR>", silent = true, desc = "Toggle all terminals" },
		-- },
		opts = {
			direction = "float",
			size = 20,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
		--     function _G.set_terminal_keymaps()
		--         local opts = { noremap = true }
		--         vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		--     end

		--     vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		--     local Terminal = require("toggleterm.terminal").Terminal
		--     local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		--     function _LAZYGIT_TOGGLE()
		--         lazygit:toggle()
		--     end

		--     local node = Terminal:new({ cmd = "node", hidden = true })

		--     function _NODE_TOGGLE()
		--         node:toggle()
		--     end

		--     local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

		--     function _NCDU_TOGGLE()
		--         ncdu:toggle()
		--     end

		--     local htop = Terminal:new({ cmd = "htop", hidden = true })

		--     function _HTOP_TOGGLE()
		--         htop:toggle()
		--     end

		--     local python = Terminal:new({ cmd = "python", hidden = true })

		--     function _PYTHON_TOGGLE()
		--         python:toggle()
		--     end
	},

	------ which-key ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
}
