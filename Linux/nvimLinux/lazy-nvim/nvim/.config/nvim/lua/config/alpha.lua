local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"                         mili's                      ",
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}
dashboard.section.buttons.val = {
	dashboard.button("f", " ❯ Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " ❯ Create New file", ":ene! <BAR> startinsert <CR>"),
	-- dashboard.button("p", " ❯ Find project", ":Telescope projects <CR>"),
	dashboard.button("r", " ❯ Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " ❯ Find text(Grep)", ":Telescope live_grep <CR>"),
	dashboard.button("c", " ❯ Configuration", ":e! ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", " ❯ Quit Neovim", ":qa!<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
dashboard.opts.noautocmd = true
vim.cmd([[autocmd User FileType alpha nofoldenable setlocal AlphaReady echo 'ready']])
