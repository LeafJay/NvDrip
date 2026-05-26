return {
    specs = { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    setup = function()
        require("catppuccin").setup({
            flavor = "mocha",
            integration = { notify = true },
        })
        vim.cmd("colorscheme catppuccin")
    end,
}
