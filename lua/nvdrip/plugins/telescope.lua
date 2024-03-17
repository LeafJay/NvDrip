return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                                          desc = "Find files" },
        { "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>", desc = "Find hidden files" },
        { "<leader>fw", "<cmd> Telescope live_grep <CR>",                                         desc = "Live grep" },
        { "<leader>fb", "<cmd> Telescope buffers <CR>",                                           desc = "Find buffers" },
        { "<leader>fh", "<cmd> Telescope help_tags <CR>",                                         desc = "Find help" },
        { "<leader>fo", "<cmd> Telescope oldfiles <CR>",                                          desc = "Find old files" },
        { "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>",                         desc = "Fuzzy finder" },
        { "<leader>gm", "<cmd> Telescope git_commits <CR>",                                       desc = "Find git commits" },
        { "<leader>gs", "<cmd> Telescope git_status <CR>",                                        desc = "Find git diffs" },
    },

    opts = {
        extensions_list = { "notify", "fzf", "ui-select", },
        defaults = {
            file_ignore_patterns = { "node%_modules/.*" },
        },

    },

    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        for _, ext in ipairs(opts.extensions_list) do
            telescope.load_extension(ext)
        end
    end,
}
