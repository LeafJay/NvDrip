
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { 'williamboman/mason.nvim' },
    },
    config = function(_, opts)
      require("nvdrip.core.utils").load_mappings("dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      require("nvdrip.core.utils").load_mappings("dap_ui")
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
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("nvdrip.core.utils").load_mappings("dap_python")
    end,
  },
}
