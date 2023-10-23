local ensure_installed = {
  "prettier",       -- prettier formatter
  "stylua",         -- lua formatter
  "black",          -- python formatter
  "mypy",           -- python static check
  "pylint",         -- python linter
  "eslint_d",       -- js linter
}

return {
  event = { "BufReadPre", "BufNewFile" },
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = ensure_installed,
      handlers = {},
    })
  end,
}
