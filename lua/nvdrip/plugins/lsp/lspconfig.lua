return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"VonHeikemen/lsp-zero.nvim",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		"simrat39/rust-tools.nvim",
	},

	config = function()
		local utils = require("nvdrip.core.utils")
		local lsp_zero = require("lsp-zero")

		require("lspconfig.ui.windows").default_options.border = "single"

		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function()
			utils.load_mappings("lspconfig")
		end)


		require("mason-lspconfig").setup({
			handlers = {
				lsp_zero.default_setup,
				jdtls = lsp_zero.noop,
				tsserver = lsp_zero.noop,
				rust_analyzer = function()
					require("rust-tools").setup({
            server = {
              ["rust_analyzer"] = {}
            }
					})
				end,
				arduino_language_server = function()
					require("lspconfig").arduino_language_server.setup({
						cmd = {
							"arduino-language-server",
							"-fqbn",
							"arduino:avr:uno",
						},
					})
				end,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				svelte = function()
					require("lspconfig").svelte.setup({
						on_attach = function(client)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
								end,
							})
						end,
					})
				end,
			},
		})
	end,
}
