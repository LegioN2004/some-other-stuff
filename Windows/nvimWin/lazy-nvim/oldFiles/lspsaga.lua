return {
    {
        'glepnir/lspsaga.nvim',
        event = "LspAttach",
        cmd = "Lspsaga",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        config = function()
            require('lspsaga').setup({
                code_action_icon = "💡",
                symbol_in_winbar = {
                    in_custom = false,
                    enable = true,
                    separator = ' ',
                    show_file = true,
                    file_formatter = "",
                },
            })
        end
    },
}
