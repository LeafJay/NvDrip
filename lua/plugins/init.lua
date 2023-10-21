local plugins = {

	"nvim-lua/plenary.nvim",

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

	{ 
    "catppuccin/nvim", name = "catppuccin", priority = 1000 
  },
}


require("lazy").setup(plugins)
