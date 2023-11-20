return {
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
}
