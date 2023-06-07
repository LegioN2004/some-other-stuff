return {
  "mfussenegger/nvim-jdtls", -- java lsp
  config = function()
    -- Java Language Server configuration.
    -- Locations:
    -- 'nvim/ftplugin/java.lua'.
    -- 'nvim/lang-servers/intellij-java-google-style.xml'

    local jdtls_ok, jdtls = pcall(require, "jdtls")
    if not jdtls_ok then
      vim.notify("JDTLS not found, install with `:MasonInstall jdtls`")
      return
    end

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
    local path_to_lsp_server = jdtls_dir .. '/config_linux'
    local path_to_plugins = jdtls_dir .. '/plugins/'
    local path_to_jar = path_to_plugins .. 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
    -- local lombok_path = path_to_plugins .. 'lombok.jar'

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    -- if root_dir == "/Users/hp/Documents/dotfiles/LegioN2004-githubthings/programs/JAVA" then
    if root_dir == "" then
      return
    end

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
    os.execute("mkdir " .. workspace_dir)

    -- Main Config
    local config = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = {
        -- '/Users/hp/Library/Java/JavaVirtualMachines/temurin-18.0.1/Contents/Home/bin/java',
        '/usr/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        -- '-javaagent:' .. lombok_path,
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', path_to_jar,
        '-configuration', path_to_lsp_server,
        '-data', workspace_dir,
      },
      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = root_dir,
      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {
          home = "/usr/bin/java",
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
            -- runtimes = {
            -- 		{
            -- 				name = "JavaSE-18",
            -- 				path = "",
            -- 		},
            -- 		{
            -- 				name = "JavaSE-17",
            -- 				path = "java",
            -- 		},
            -- },
          },
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          format = {
            enabled = true,
            settings = {
              url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
              profile = "GoogleStyle",
            },
          },
        },
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
          importOrder = {
            "java",
            "javax",
            "com",
            "org",
          },
        },
        -- extendedClientCapabilities = extendedClientCapabilities,
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          },
          useBlocks = true,
        },
      },
      flags = {
        allow_incremental_sync = true,
      },
      init_options = {
        bundles = {},
      },
    }

    config["on_attach"] = function(client, bufnr)
      require("keymaps").map_java_keys(bufnr)
      require("lsp").on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        floating_window_above_cur_line = false,
        padding = "",
        handler_opts = {
          border = "rounded",
        },
      }, bufnr)
    end

    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require("jdtls").start_or_attach(config)

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua  vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'K', '<cmd>lua  vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua  vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('i', '<C-h>', '<cmd>lua  vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>wfl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
      opts)
    vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua  vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vws', '<cmd>lua  vim.lsp.buf.workspace_symbol()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua  vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua  vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>sld', '<cmd>lua  vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua  vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua  vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vca', '<cmd>lua  vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vrr', '<cmd>lua  vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vc', '<cmd>lua  function().lsp.buf.formatting() end<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vrn', '<cmd>lua  vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>jca', '<cmd>lua require(\'jdtls\').code_action()<CR>', { silent = true })
  end,
}
