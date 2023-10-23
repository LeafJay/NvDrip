local utils = require("nvdrip.core.utils")

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {'nvim-telescope/telescope-ui-select.nvim' }
  },

  init = function()
    utils.load_mappings("telescope")
  end,

  opts = {
    extensions_list = { "notify", "fzf", "ui-select" },
  },


  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    for _, ext in ipairs(opts.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
