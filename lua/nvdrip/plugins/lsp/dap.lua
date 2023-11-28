return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      vim.keymap.set(
        "n",
        "<leader>dc",
        '<cmd>lua require("dap").continue()<CR>',
        { noremap = true, silent = true }
      )
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    init = function()
      vim.keymap.set("n", "<leader>du", '<cmd>lua require("dapui").toggle("sidebar")<CR>')
    end,
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
    lazy = false,
    config = function(_, opts)
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
    init = function()
      vim.keymap.set("n", "<leader>dtm", '<cmd>lua require("dap-python").test_method()<CR>')
    end,
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}
