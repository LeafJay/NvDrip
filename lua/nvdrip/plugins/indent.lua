return {
    specs = { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "indent-blankline" },
    setup = function()
        require("ibl").setup({
            indent = { char = "│" },
            scope = { enabled = true, char = "┃", show_start = true, show_end = false },
        })
    end,
}
