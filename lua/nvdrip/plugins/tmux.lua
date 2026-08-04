return {
    specs = { src = "https://github.com/aserowy/tmux.nvim", name = "tmux" },
    setup = function()
        -- Disable tmux.nvim's C-h/j/k/l so herdr_nav.lua (after/plugin) wins.
        require("tmux").setup({
            navigation = { enable_default_keybindings = false },
        })
    end,
}
