return {
    specs = { src = "https://github.com/folke/which-key.nvim", name = "which-key" },
    setup = function()
        vim.o.timeout = true
        require("which-key").setup({})
    end,
}
