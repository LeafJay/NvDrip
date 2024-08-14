return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>e", "<cmd>Oil<cr>", desc = "File Explorer" },
    }
}
