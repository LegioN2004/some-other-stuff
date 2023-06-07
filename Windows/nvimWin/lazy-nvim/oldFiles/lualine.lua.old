return {
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		opts = function()
			local icons = require("core.icons")
			local function fg(name)
				return function()
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
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
	}
