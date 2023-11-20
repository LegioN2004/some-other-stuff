return {
	{
		"nvim-tree/nvim-tree.lua", -- File browser
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		config = function()
			local icons = require("core.icons").git
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
				hijack_netrw = false,
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
}
