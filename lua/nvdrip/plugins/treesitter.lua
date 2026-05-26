return {
    specs = { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
    hooks = {
        { match = "nvim-treesitter", cmd = "TSUpdate" },
    },
    setup = function()
        -- New nvim-treesitter API: setup only configures install_dir
        require("nvim-treesitter").setup({})
        -- Highlight and indent via Neovim's native treesitter
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
