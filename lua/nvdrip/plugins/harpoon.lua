return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.keymap.set(
      { "n", "t" },
      "<leader>a",
      '<cmd>lua require("harpoon.mark").add_file()<CR>'
    )
    vim.keymap.set(
      { "n", "t" },
      "<leader>m",
      '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>'
    )
  end,

  opts = {
    menu = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  },
}
