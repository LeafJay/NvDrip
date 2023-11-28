return {
  "SmiteshP/nvim-navbuddy",
  config = function()
    require("nvim-navbuddy").setup()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>e",
      "<cmd>lua require('nvim-navbuddy').open()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
