local status, lualine = pcall(require, 'lualine')
if (not status) then return end
lualine.setup ({
options = {
	-- ... your lualine config
        icons_enabled = true,
        theme = 'solarized_dark',
     ---from Devaslife---------------------------------------------------------------------------------------------------------------------------
	{ 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
	'encoding',
	'filetype',
	theme = 'auto',
}
})
