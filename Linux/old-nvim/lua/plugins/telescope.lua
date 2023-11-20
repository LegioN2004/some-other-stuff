return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
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
}
