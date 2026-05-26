return {
    specs = { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
    setup = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "black" },
                svelte = { "prettier" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
            },
        })
        vim.keymap.set("n", "<leader>fm", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
    end,
}
