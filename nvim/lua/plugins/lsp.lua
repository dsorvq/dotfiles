return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local function setup_clangd()
        require("lspconfig").clangd.setup {
          capabilities = capabilities,
          cmd = { "clangd" },
          init_options = {
            fallbackFlags = { "-std=c++20" },
          },
        }
      end

      local function setup_bash()
        require("lspconfig").bashls.setup {}
      end

      local function setup_go()
        require("lspconfig").gopls.setup {}
      end

      local function setup_python()
        require('lspconfig').pyright.setup({
          capabilities = capabilities,
          settings = {
            pyright = {
              disableOrganizeImports = false,
              analysis = {
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic"
              }
            }
          }
        })

        require('lspconfig').ruff.setup {
          capabilities = capabilities,
        }
      end

      setup_clangd()
      setup_bash()
      setup_go()
      setup_python()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  -- TODO: move to separate module?
  {
    "tpope/vim-sleuth"
  },
}

