return {
  "numToStr/FTerm.nvim",
  opts = {
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  },
  init = function()
    vim.keymap.set(
      { "n", "t" },
      "<M-i>",
      '<cmd>lua require("FTerm").toggle()<CR>',
      { noremap = true, silent = true }
    )
  end,

  config = function(_, opts)
    require("FTerm").setup(opts)
  end,
}
