local utils = require("core.utils")

local plugins = {

	"nvim-lua/plenary.nvim",
  
  {
    "nvim-treesitter/nvim-treesitter",

    init = function()
      require("core.utils").lazy_load "nvim-treesitter"
    end,

    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",

    opts = function()
      return require "plugins.configs.treesitter"
    end,

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },

    init = function()
      utils.load_mappings("telescope")
    end,

    opts = function()
      return require("plugins.configs.telescope")
    end,

    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

	{ 
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },
    
  {
    'nvim-tree/nvim-web-devicons'
  },

  { 
    "tiagovla/scope.nvim"
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.luasnips")(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  
}


require("lazy").setup(plugins)
