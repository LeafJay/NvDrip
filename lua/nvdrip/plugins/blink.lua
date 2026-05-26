return {
    specs = {
        { src = "https://github.com/saghen/blink.cmp", name = "blink.cmp" },
        { src = "https://github.com/rafamadriz/friendly-snippets", name = "friendly-snippets" },
    },
    hooks = {
        {
            match = "blink.cmp",
            fn = function()
                local pack_path = vim.fn.stdpath("data") .. "/pack"
                local plugin_dir = vim.fn.glob(pack_path .. "/*/start/blink.cmp", false, true)[1]
                    or vim.fn.glob(pack_path .. "/*/opt/blink.cmp", false, true)[1]
                if plugin_dir then
                    vim.system({ "cargo", "build", "--release" }, { cwd = plugin_dir })
                end
            end,
        },
    },
    setup = function()
        require("blink.cmp").setup({
            keymap = { preset = "enter" },
            appearance = { nerd_font_variant = "mono" },
            completion = { documentation = { auto_show = false } },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            fuzzy = { implementation = "lua" },
        })
    end,
}
