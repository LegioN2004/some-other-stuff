local m = {}

local wk = require("which-key")
local mappings = {
	q = { ":q<CR>", "Quit" },
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)

return m
