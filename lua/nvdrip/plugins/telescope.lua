local utils = require("nvdrip.core.utils")

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
		utils.load_mappings("telescope")
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
