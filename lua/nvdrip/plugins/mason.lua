return {
	"williamboman/mason.nvim",
	lazy = false,
	opts = {

		registries = {
			"github:nvim-java/mason-registry",
			"github:mason-org/mason-registry",
		},
		ui = {
			border = "single",
			height = 0.8,
			icons = {
				package_installed = "●",
				package_pending = "",
				package_uninstalled = "○",
			},

			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
		max_concurrent_installers = 10,
	},
}
