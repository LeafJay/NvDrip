return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,

    opts = {
      flavour = "mocha",
      floating_border = "on",
      transparent_background = true,
    },
    
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,

    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
}
