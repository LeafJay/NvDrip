return {
    specs = { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
    setup = function()
        require("mason").setup({})
    end,
}
