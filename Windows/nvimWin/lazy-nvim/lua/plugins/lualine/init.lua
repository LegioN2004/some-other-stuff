return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lualine = require "lualine"
    local stl = require "plugins.lualine.components"
    local theme = require "plugins.lualine.theme"

    lualine.setup {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          { statusline = { "dashboard", "Alpha" } },
          -- "dashboard",
          -- "alpha",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "toggleterm",
          "lazy",
          "packer",
          "NvimTree",
          "lspsagaoutline",
        },
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          stl.mode,
          stl.lsp,
          stl.diagnostics,
          "%=",
          stl.filename,
        },
        lualine_x = {
          stl.diff,
          stl.branch,
          stl.filesize,
          stl.percent,
          stl.progress,
          stl.total_lines,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
