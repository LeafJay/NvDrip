return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"kristijanhusak/vim-dadbod-completion",
		"saecki/crates.nvim",
	},

	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		lsp_zero.extend_cmp()
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({

			window = {
				completion = cmp.config.window.bordered({ border = "single" }),
				documentation = cmp.config.window.bordered({ border = "single" }),
			},

			completion = {
				--completeopt = "menu,menuone,preview,noselect",
			},

			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<C-Space>"] = cmp.mapping.complete(),
			}),

			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
				}),
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "vim-dadbod-completion" },
				{ name = "crates" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
		})
	end,
}
