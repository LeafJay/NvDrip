local ensure_installed = { 'tsserver', 'tailwindcss', 'lua_ls', 'jdtls','rust_analyzer','svelte' }

return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim', }
  },

  config = function()
    local utils = require("nvdrip.core.utils")
    local lsp_zero = require('lsp-zero')

    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
      utils.load_mappings("lsp")
    end)

    require('mason-lspconfig').setup({
      ensure_installed = ensure_installed,
      handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop,
        tsserver = lsp_zero.noop,
        rust_analyzer = lsp_zero.noop,
      },
    })
  end,
}
