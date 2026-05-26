return {
    specs = {
        { src = "https://github.com/SmiteshP/nvim-navic", name = "nvim-navic" },
        { src = "https://github.com/SmiteshP/nvim-navbuddy", name = "nvim-navbuddy" },
        { src = "https://github.com/MunifTanjim/nui.nvim", name = "nui" },
    },
    setup = function()
        require("nvim-navic").setup({ lsp = { auto_attach = false }, highlight = true })
        require("nvim-navbuddy").setup({ lsp = { auto_attach = false } })
    end,
}
