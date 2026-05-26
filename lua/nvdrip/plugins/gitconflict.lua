return {
    specs = { src = "https://github.com/akinsho/git-conflict.nvim", name = "git-conflict" },
    setup = function()
        require("git-conflict").setup({})
    end,
}
