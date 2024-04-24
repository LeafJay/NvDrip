return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python", "htmldjango" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			disable = { "latex", "bib" },
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
