return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    require("nvdrip.core.utils").load_mappings("harpoon")
  end,

  opts = {
    menu = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  },
}
