local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
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

-- local opts = { noremap = true, silent = true }
-- -- keymaps
-- vim.keymap.set('n', 'ff',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
vim.keymap.set("n", "<leader>te", ":Telescope<CR>")
vim.keymap.set('n', '<leader><space>', function()
  builtin.find_files()
end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
-- vim.keymap.set('n', '<leader>te', function ()
--     telescope.setup()
-- end)
-- vim.keymap.set('n', '<leader>te', ":Telescope<CR>")
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

-- vim.keymap.set("n", "sf", function()
--   telescope.extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
--   })
-- end)

