return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "VonHeikemen/lsp-zero.nvim",
    "mfussenegger/nvim-dap",
    'simrat39/rust-tools.nvim'
  },

  config = function()
    local utils = require("nvdrip.core.utils")
    local lsp_zero = require("lsp-zero")
    local lspconfig = require("lspconfig")
    local lua_opts = lsp_zero.nvim_lua_ls()

    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function()
      utils.load_mappings("lsp")
    end)

    lspconfig.lua_ls.setup(lua_opts)

    local rust_tools = require('rust-tools')

    rust_tools.setup({
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>ha', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true
            },
          }
        }
      }
    })
  end,
}
