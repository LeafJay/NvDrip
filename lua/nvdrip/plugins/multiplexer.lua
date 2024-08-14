return {
	"aserowy/tmux.nvim",
	init = function()
	end,
	config = function()
		require("tmux").setup({
			copy_sync = {
				enable = false,
			},
		})
	end,
}
