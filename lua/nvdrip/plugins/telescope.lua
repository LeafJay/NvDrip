return {
    specs = {
        { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope", version = "v0.2.2" },
        { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
        { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", name = "telescope-fzf-native" },
    },
    hooks = {
        {
            match = "telescope-fzf-native",
            fn = function()
                local pack_path = vim.fn.stdpath("data") .. "/pack"
                local plugin_dir = vim.fn.glob(pack_path .. "/*/start/telescope-fzf-native", false, true)[1]
                    or vim.fn.glob(pack_path .. "/*/opt/telescope-fzf-native", false, true)[1]
                if plugin_dir then
                    vim.system(
                        { "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" },
                        { cwd = plugin_dir },
                        function()
                            vim.system(
                                { "cmake", "--build", "build", "--config", "Release", "--target", "install" },
                                { cwd = plugin_dir }
                            )
                        end
                    )
                end
            end,
        },
    },
    setup = function()
        require("telescope").setup({})
        pcall(function() require("telescope").load_extension("fzf") end)
        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", { desc = "Find Hidden Files" })
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
        vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "View Diagnostics" })
    end,
}
