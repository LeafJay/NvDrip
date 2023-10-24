return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,

  opts = {
    flavour = "mocha",
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      mason = true,
      noice = true,
      notify = true,
      lsp_trouble = true,
      which_key = true,
      barbar = true,
    },
    transparent_background = true,
  },

  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,

  config = function(_, opts)
    require("catppuccin").setup(opts)
  end,
}
