local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			sources = {
				--linting
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.shellcheck,

				--formatting
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.formatting.latexindent,

				--code actions
			},
		})
	end,
}
