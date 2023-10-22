return {
  'Exafunction/codeium.nvim',
  event = 'BufEnter',

  init = function()
    vim.g.codeium_disable_bindings = 1
  end,

  config = function()
    require("codeium").setup()
  end,
}
