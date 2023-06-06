 -- Getting you where you want with the fewest keystrokes
  return {
	{ 'ThePrimeagen/vim-be-good' }, --Vim be good is a plugin designed to make you better at vim by creating a game to practice basic movements in
	{ "theprimeagen/refactoring.nvim" },
    "ThePrimeagen/harpoon",
    event = VeryLazy,
    cmd = "Harpoon",
    keys = {
      {
        "<leader>Ha",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        mode = "n",
        desc = "Harpoon Menu",
      },
      {
        "<leader>ad",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Harpoon Add File",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        mode = "n",
        desc = "Harpoon Nav File 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        mode = "n",
        desc = "Harpoon Nav File 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        mode = "n",
        desc = "Harpoon Nav File 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        mode = "n",
        desc = "Harpoon Nav File 4",
      },
    },
    config = function()
      vim.api.nvim_create_autocmd({ "Filetype" }, {
        pattern = "harpoon",
        callback = function()
          vim.opt.cursorline = true
          vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
          vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
        end,
      })
    end,
  }
