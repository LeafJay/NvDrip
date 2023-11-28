return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nosduco/remote-sshfs.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "ThePrimeagen/harpoon",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  init = function()
    vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
    vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
    vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
    vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
    vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
    vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
    vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>")
    vim.keymap.set("n", "<leader>gm", "<cmd> Telescope git_commits <CR>")
    vim.keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>")
  end,

  opts = {
    extensions_list = { "remote-sshfs", "notify", "fzf", "ui-select", "harpoon" },
    defaults = {
      border = {},
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
