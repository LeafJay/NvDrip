return {
    specs = { src = "https://github.com/aserowy/tmux.nvim", name = "tmux" },
    setup = function()
        require("tmux").setup({})
    end,
}
