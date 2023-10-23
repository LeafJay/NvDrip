local utils = require("nvdrip.core.utils")

return {
  {
    "tiagovla/scope.nvim",
    lazy = false,
    config = true,
  },
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "tiagovla/scope.nvim",
    "catppuccin/nvim",
  },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thick",
      diagnostics = "nvim_lsp",
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end
  },
}
