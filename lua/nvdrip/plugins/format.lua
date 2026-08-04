return {
    specs = { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
    setup = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                svelte = { "prettier" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                cmake = { "gersemi" },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "--style={IndentWidth: 2}" },
                },
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = function()
                vim.bo.shiftwidth = 2
                vim.bo.tabstop = 2
                vim.bo.softtabstop = 2
                vim.bo.expandtab = true
            end,
        })
        vim.keymap.set("n", "<leader>fm", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
    end,
}
