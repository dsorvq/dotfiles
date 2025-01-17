return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local function setup_lua_ls()
        require("lspconfig").lua_ls.setup {
          capabilities = capabilities,
          on_init = function(client)
            local lua_settings = client.config.settings.Lua or {}
            client.config.settings.Lua = vim.tbl_deep_extend("force", lua_settings, {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
            })
          end,
          settings = {
            Lua = {},
          },
        }
      end

      local function setup_clangd()
        require("lspconfig").clangd.setup {
          capabilities = capabilities,
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          init_options = {
            -- fallbackFlags = { "-std=c++17" },
          },
        }
      end

      setup_lua_ls()
      setup_clangd()
    end,
  },

  -- TODO: move to separate module?
  {
    "tpope/vim-sleuth"
  },
}

