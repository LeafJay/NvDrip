return {
    'quarto-dev/quarto-nvim',
    dependencies = {
        'jmbuhr/otter.nvim',
        'hrsh7th/nvim-cmp',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
        "jpalardy/vim-slime"
    },

    opts = {
        codeRunner = {
            enabled = true,
            default_method = "slime"
        }
    }
}
