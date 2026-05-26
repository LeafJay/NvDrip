return {
    specs = {
        { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
        { src = "https://github.com/b0o/SchemaStore.nvim", name = "SchemaStore" },
    },
    setup = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(e)
                local client = vim.lsp.get_client_by_id(e.data.client_id)

                if client and client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, e.buf)
                    require("nvim-navbuddy").attach(client, e.buf)
                end

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
                vim.keymap.set("n", "<leader>fs", require("nvim-navbuddy").open, { desc = "View symbols" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Trigger code action" })
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
            end,
        })

        vim.lsp.config("jsonls", {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.enable({
            "lua_ls",
            "basedpyright",
            "glsl_analyzer",
            "svelte",
            "ts_ls",
            "jsonls",
            "tailwindcss",
            "clangd",
        })

        vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true } })
        vim.lsp.inlay_hint.enable(true)
    end,
}
