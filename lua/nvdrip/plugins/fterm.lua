return {
  "numToStr/FTerm.nvim",
  opts = {
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  },
  init = function()
    require("nvdrip.core.utils").load_mappings("fterm")
  end,
  
  config = function(_,opts)
    require('FTerm').setup(opts)
  end
}
