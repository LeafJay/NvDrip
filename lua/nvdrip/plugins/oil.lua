return {
    specs = {
        { src = "https://github.com/stevearc/oil.nvim", name = "oil" },
        { src = "https://github.com/benomahony/oil-git.nvim", name = "oil-git" },
    },
    setup = function()
        require("oil").setup({})
        vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "File Explorer" })
    end,
}
