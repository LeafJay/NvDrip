return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>dc",
				'<cmd>lua require("dap").continue()<CR>',
				desc = "Dap continue",
				noremap = true,
				silent = true,
			},
			{
				"<leader>db",
				'<cmd>lua require("dap").toggle_breakpoint()<CR>',
				desc = "Toggle breakpoint",
				noremap = true,
				silent = true,
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

		keys = {
			{ "<leader>du", '<cmd>lua require("dapui").toggle("sidebar")<CR>', desc = "Dap UI sidebar toggle" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open("sidebar")
			end
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		keys = {
			{ "<leader>dtm", '<cmd>lua require("dap-python").test_method()<CR>', desc = "Test python method" },
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
}
