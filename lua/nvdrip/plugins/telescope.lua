local utils = require("nvdrip.core.utils")

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },

  init = function()
    utils.load_mappings("telescope")
  end,

  opts = {
    extensions_list = { "scope", "notify" },
  },


  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    for _, ext in ipairs(opts.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
