return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
        tsserver_plugins = {
            "typescript-svelte-plugin",
        },

        code_lens = "on",
    },
}
