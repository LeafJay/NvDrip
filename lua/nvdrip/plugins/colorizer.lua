return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    user_default_options = {
      css = true,
      AARRGGBB = true,
      tailwind = true,
      always_update = "cmp_docs",
    }
  },
  config = function(_, opts)
    require("colorizer").setup(opts)
  end,
}
