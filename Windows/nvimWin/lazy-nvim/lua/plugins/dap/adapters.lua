return {
  debugpy = {
    name = "debugpy", -- for mason installer
    path = _G.IS_WINDOWS and vim.fn.stdpath("data") .. "mason\\packages\\debugpy\\venv\\bin\\python"
      or vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
  },
  require("dap").configurations.java == { { type = 'java'; request = 'attach'; name = "Debug (Attach) - Remote"; hostName = "127.0.0.1"; port = 8000; }, },
}
