local ensure_installed = {
  --lsps
  "typescript-language-server",
  "tailwindcss-language-server",
  "lua-language-server",
  "jdtls",
  "rust-analyzer",
  "svelte-language-server",

  --formatters
  "stylua",
  --rustfmt --installed via rustup

  --linters
  "luacheck",

  --daps
  "java-debug-adapter",
  "debugpy",
  "codelldb",
  --java-test --waiting for >=0.40
}

return {
  "williamboman/mason.nvim",
  lazy = false,
  opts = {
    ui = {
      border = "single",
      height = 0.8,
      icons = {
        package_installed = "●",
        package_pending = "",
        package_uninstalled = "○",
      },


      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 10,
  },

  config = function(_, opts)
    require("mason").setup(opts)
    vim.api.nvim_create_user_command('MasonInstallAll',
      function()
        vim.cmd("MasonUpdate")
        for _, server in ipairs(ensure_installed) do
          vim.cmd("MasonInstall " .. server)
        end
      end, {})
  end,
}
