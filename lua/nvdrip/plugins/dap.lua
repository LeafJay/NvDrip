return {
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
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
