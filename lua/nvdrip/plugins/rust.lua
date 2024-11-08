return {
    {
        "saecki/crates.nvim",
        opts = {
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },

        config = function(_, opts)
            require("crates").setup(opts)
        end,

        keys = {

        }
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        lazy = false,
        init = function()
            vim.g.inlay_hints_visible = true
            vim.g.rustaceanvim = function()
                local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
                local codelldb_path = extension_path .. 'adapter/codelldb'
                local liblldb_path = extension_path .. 'lldb/lib/liblldb'
                local this_os = vim.uv.os_uname().sysname;
                liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
                local cfg = require('rustaceanvim.config')

                return {
                    tools = {},

                    dap = {
                        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                    },
                    server = {
                        default_settings = {
                            ["rust-analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                    loadOutDirsFromCheck = true,
                                    runBuildScripts = true,
                                },
                                checkOnSave = {
                                    allFeatures = true,
                                    command = "clippy",
                                    extraArgs = {
                                        "--",
                                        "--no-deps",
                                        "-Dclippy::correctness",
                                        "-Dclippy::complexity",
                                        "-Wclippy::perf",
                                        "-Wclippy::pedantic",
                                    },
                                },
                                procMacro = {
                                    enable = true,
                                    ignored = {
                                        ["async-trait"] = { "async_trait" },
                                        ["napi-derive"] = { "napi" },
                                        ["async-recursion"] = { "async_recursion" },
                                    },
                                },
                            },
                        },
                    },
                }
            end
        end,
    },
}
