return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"jpalardy/vim-slime",
	},

	init = function()
		vim.g.slime_target = "tmux"
	end,

	opts = {
		codeRunner = {
			enabled = true,
			default_method = "slime",
		},
	},

    -- keys = {
    --     { "n", "<leader>jr","<cmd>lua require('quartro.runner').run_cell<cr>", { noremap = true, silent = true } },
    -- }
}
