local utils = require("nvdrip.core.utils")

return {
  dependencies = {
    {
      "tiagovla/scope.nvim",
      init = function()
        utils.load_mappings("scope")
      end,
      config = function()
        require("scope").setup({})
      end,
    },
  },

  "romgrk/barbar.nvim",
  config = function()
    require("barbar").setup()
  end
}
