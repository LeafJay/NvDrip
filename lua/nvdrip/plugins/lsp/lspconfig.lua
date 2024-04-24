return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "SmiteshP/nvim-navic",
    },
    config = function()
        require("neodev").setup({})

        local lspconfig = require("lspconfig")
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                vim.keymap.set({ "n", "x" }, "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

                vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
                vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
                vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, event.buf)
                end

                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(event.buf, true)
                end
            end,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.lua_ls.setup({})

        lspconfig.texlab.setup({
            capabilities = capabilities,
            settings = {
                latexFormatter = "latexindent",
            }
        })

        lspconfig.cssls.setup({
            capabilities = capabilities
        })

        lspconfig.svelte.setup({
            capabilities = capabilities
        })

        lspconfig.html.setup({
            capabilities = capabilities
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
        })

        lspconfig.htmx.setup {
            capabilities = capabilities,
        }
    end
}
