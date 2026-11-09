return {
    specs = {
        { src = "https://github.com/mfussenegger/nvim-dap", name = "nvim-dap" },
        { src = "https://github.com/nvim-neotest/nvim-nio", name = "nvim-nio" },
        { src = "https://github.com/rcarriga/nvim-dap-ui", name = "nvim-dap-ui" },
        { src = "https://github.com/theHamsta/nvim-dap-virtual-text", name = "nvim-dap-virtual-text" },
    },
    setup = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        require("nvim-dap-virtual-text").setup({})

        -- gdb >= 14 speaks DAP natively
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/build/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Attach to process",
                type = "gdb",
                request = "attach",
                pid = function()
                    return require("dap.utils").pick_process()
                end,
            },
        }
        dap.configurations.c = dap.configurations.cpp

        dap.listeners.after.event_initialized["dapui"] = dapui.open
        dap.listeners.before.event_terminated["dapui"] = dapui.close
        dap.listeners.before.event_exited["dapui"] = dapui.close

        local map = vim.keymap.set
        map("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        map("n", "<leader>bB", function()
            dap.set_breakpoint(vim.fn.input("Condition: "))
        end, { desc = "Conditional breakpoint" })
        map("n", "<leader>bu", dapui.toggle, { desc = "Toggle debug UI" })
        map("n", "<leader>br", dap.repl.toggle, { desc = "Toggle debug REPL" })
        map("n", "<leader>bt", dap.terminate, { desc = "Terminate debug session" })
        map("n", "<F5>", dap.continue, { desc = "Debug continue/start" })
        map("n", "<F10>", dap.step_over, { desc = "Step over" })
        map("n", "<F11>", dap.step_into, { desc = "Step into" })
        map("n", "<F12>", dap.step_out, { desc = "Step out" })
    end,
}
