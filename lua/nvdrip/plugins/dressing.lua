return {
	"stevearc/dressing.nvim",
	opts = {
		builtin = {
			border = "single",
		},
		input = {
			border = "single",
		},
		nui = {
			border = {
				style = "single",
			},
		},
	},
	config = function(_, opts)
		require("dressing").setup(opts)
	end,
}
