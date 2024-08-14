return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
        flavor = "mocha",
        integration = {
            notify = true,
        }
    },

    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd [[colorscheme catppuccin]]
    end
}

