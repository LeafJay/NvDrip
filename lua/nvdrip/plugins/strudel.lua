return {
    specs = { src = "https://github.com/gruvw/strudel.nvim", name = "strudel" },
    hooks = {
        {
            match = "strudel",
            fn = function()
                local pack_path = vim.fn.stdpath("data") .. "/pack"
                local plugin_dir = vim.fn.glob(pack_path .. "/*/start/strudel", false, true)[1]
                    or vim.fn.glob(pack_path .. "/*/opt/strudel", false, true)[1]
                if plugin_dir then
                    vim.system({ "npm", "install" }, { cwd = plugin_dir })
                end
            end,
        },
    },
    setup = function()
        require("strudel").setup({})
    end,
}
