local ensure_installed = {
  "tsserver",
  "tailwindcss",
  "lua_ls",
  "jdtls",
  "rust_analyzer",
  "svelte",

  "prettier", -- prettier formatter
  "stylua",   -- lua formatter
  "black",    -- python formatter
  "mypy",     -- python static check
  "pylint",   -- python linter
  "eslint_d", -- js linter

  "java-test",
  "java-debug-adapter",
  "debugpy"
}


return {
  'williamboman/mason.nvim',
  lazy = false,
  config = true,
}
