return {
		-- statusline
		{
				"nvim-lualine/lualine.nvim",
				-- event = "VeryLazy",
				opts = function()
						local icons = require("lazyvim.config").icons

						local function fg(name)
								return function()
										---@type {foreground?:number}?
										local hl = vim.api.nvim_get_hl_by_name(name, true)
										return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
								end
						end

						return {
								options = {
										theme = "auto",
										globalstatus = true,
										disabled_filetypes = { statusline = { "dashboard", "alpha" } },
										-- section_separators = { left = '', right = '' },
										-- component_separators = { left = '', right = '' },
								},
								sections = {
										lualine_a = { "mode" },
										lualine_b = { "branch" },
										-- 		disabled_filetypes = {}
										-- 			file_status = true, -- displays file status (readonly status, modified status)
										-- 			path = 0   -- 0 = just filename, 1 = relative path, 2 = absolute path
										-- 		lualine_x = {
										-- 			{
										-- 				'diagnostics',
										-- 				sources = { "nvim_diagnostic" },
										-- 				symbols = {
										-- 					error = ' ',
										-- 					warn = ' ',
										-- 					info = ' ',
										-- 					hint = ' '
										-- 				}
										-- 			},
										-- 			'encoding',
										lualine_x = {
												{
														"diff",
														symbols = {
																added = icons.git.added,
																modified = icons.git.modified,
																removed = icons.git.removed,
														},
												},
												{ "filetype", icon_only = true, separator = "  ", padding = { left = 1, right = 1 } },
												-- stylua: ignore
												{
														function() return require("nvim-navic").get_location() end,
														cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
												},
										},
										lualine_c = {
												-- stylua: ignore
												{ "filename", path = 1, symbols = { separator = "  ", modified = "  ", readonly = "  ", unnamed = "  " } },
												{
														function() return require("noice").api.status.command.get() end,
														cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
														color = fg("Statement")
												},
												-- stylua: ignore
												{
														function() return require("noice").api.status.mode.get() end,
														cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
														color = fg("Constant") ,
												},
												{
														require("lazy.status").updates,
														cond = require("lazy.status").has_updates,
														color = fg("Special"),
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
										},
										lualine_y = {
												{ "progress", separator = "", padding = { left = 1, right = 0 } },
												{ "location", padding = { left = 1, right = 1 } },
										},
										lualine_z = {
												function()
														return " " .. os.date("%R")
												end,
										},
								},
								extensions = { "neo-tree", "nerdtree", "lazy" },
						}
				end,
		},

	-- noicer ui
			-- {
		-- "folke/noice.nvim",
		-- event = "VeryLazy",
		-- opts = {
			-- lsp = {
			-- 	override = {
			-- 		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 		["vim.lsp.util.stylize_markdown"] = true,
			-- 	},
			-- },
			-- presets = {
			-- 	bottom_search = true,
			-- 	command_palette = true,
			-- 	long_message_to_split = true,
			-- },
		-- },
    -- -- stylua: ignore
    -- keys = {
      -- { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      -- { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      -- { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      -- { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      -- { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      -- { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    -- },
	-- },
}
