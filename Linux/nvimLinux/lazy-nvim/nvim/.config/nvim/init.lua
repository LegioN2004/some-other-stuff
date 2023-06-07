require("config.settings")
-- lazy stuff

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader key = space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--put plugins here
require("lazy").setup('plugins', {
  -- install = { colorscheme = { "gruvbox" } },
  ui = {
    border = "rounded",
  },
  checker = { enabled = true },
  debug = false,
  defaults = { lazy = true },
  change_detection = {
    notify = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrw",
      },
    },
  },
})

require("config.keymaps")
require("config.alpha")
require("config.macros")
require("config.functions")
-- lazy stuff
vim.api.nvim_create_autocmd("User", {
  callback = function()
    require("config.autocmds")
  end,
})

-- local has = function(x)
-- 	return vim.fn.has(x) == 1
-- end

-- local is_win = has("win32")
-- local is_mac = has("macunix")
-- -- local is_unix = has "Linux"

-- if is_mac then
-- 	require("macos")
-- end

-- if is_win then
-- 	require("windows")
-- end

-- if is_unix then
--     require('unix')
-- end

vim.cmd([[
let g:coc_node_path = '~/.nvm/versions/node/v18.15.0/bin/node'
let g:coc_npm_path = '~/.nvm/versions/node/v18.15.0/bin/node'
au! BufWritePost $MYVIMRC source %
]])
