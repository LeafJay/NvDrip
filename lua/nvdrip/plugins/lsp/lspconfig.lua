return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "VonHeikemen/lsp-zero.nvim",
        "mfussenegger/nvim-dap",
        "simrat39/rust-tools.nvim",
        "SmiteshP/nvim-navic",
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
            },
            opts = { lsp = { auto_attach = true } },
        },
    },

    config = function()
        local lsp_zero = require("lsp-zero")
        local lspconfig = require("lspconfig")
        local lua_opts = lsp_zero.nvim_lua_ls()
        local mason_registry = require("mason-registry")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr }
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
                require("nvim-navic").attach(client, bufnr)
                require("nvim-navbuddy").attach(client, bufnr)
            end
        end)

        lsp_zero.setup_servers({ "bashls" })
        lspconfig.lua_ls.setup(lua_opts)

        local rust_tools = require("rust-tools")
        local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
        local codelldb_path = codelldb_root .. "adapter/codelldb"
        local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

        rust_tools.setup({
            dap = {
                adapter = {
                    type = "server",
                    port = "${port}",
                    host = "127.0.0.1",
                    executable = {
                        command = codelldb_path,
                        args = { "--liblldb", liblldb_path, "--port", "${port}" },
                    },
                },
            },
            server = {
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>h", function()
                        rust_tools.hover_actions.hover_actions()
                    end, { buffer = bufnr })
                end,
                settings = {
                    ["rust_analyzer"] = { cargo = { allFeatures = true } },
                },
                checkOnSave = {
                    allFeatures = true,
                    overrideCommand = {
                        "cargo",
                        "clippy",
                        "--workspace",
                        "--message-format=json",
                        "--all-targets",
                        "--all-features",
                    },
                },
            },
        })
    end,
}
