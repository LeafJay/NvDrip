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
        version = "^4",
        ft = { "rust" },
        lazy = false,
        init = function()
            vim.g.inlay_hints_visible = true
            vim.g.rustaceanvim = {
                tools = {},
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
        end,
    },
}
