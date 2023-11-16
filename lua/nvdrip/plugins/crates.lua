return {
	"saecki/crates.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("crates").setup({

    })
	end,
}
