local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

-- local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			}
		}
	}
}
--   extensions = {
--     file_browser = {
--       theme = "dropdown",
--       -- disables netrw and use telescope-file-browser in its place
--       hijack_netrw = true,
--       mappings = {
--         -- your custom insert mode mappings
--         ["i"] = {
--           ["<C-w>"] = function() vim.cmd('normal vbd') end,
--         },
--         ["n"] = {
--           -- your custom normal mode mappings
--           ["N"] = fb_actions.create,
--           ["h"] = fb_actions.goto_parent_dir,
--           ["/"] = function()
--             vim.cmd('startinsert')
--           end
--         }
--       }
--     }
--   }
-- }

-- telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
-- keymaps
vim.keymap.set('n', '<leader><space>',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = false
		})
	end)
vim.keymap.set('n', ';r', function()
	builtin.live_grep()
end)
vim.keymap.set('n', ';h', function()
	builtin.help_tags()
end)
vim.keymap.set('n', '<leader>tr', function()
 builtin.resume()
end)
vim.keymap.set('n', ';d', function()
	builtin.diagnostics()
end)

vim.keymap.set('n', '<leader>ps', function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>?', function()
				require("telescope.builtin").current_buffer_fuzzy_find()
end)
vim.keymap.set('n', '<leader>;', function()
				require("telescope.builtin").command_history()
end)
vim.keymap.set('n', '<leader>:', function()
				require("telescope.builtin").commands()
end)
vim.keymap.set('n', '<leader>bb', function()
				require("telescope.builtin").buffers()
end)
vim.keymap.set('n', '<leader>cs', function()
				require("telescope.builtin").lsp_document_symbols()
end)
vim.keymap.set('n', '<leader>fr', function()
				require("telescope.builtin").oldfiles()
end)
vim.keymap.set('n', '<leader>km', function()
				require("telescope.builtin").keymaps()
end)
