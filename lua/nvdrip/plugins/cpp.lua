return {
    specs = {
        { src = "https://github.com/madskjeldgaard/cppman.nvim", name = "cppman" },
        { src = "https://github.com/p00f/clangd_extensions.nvim", name = "clangd_extensions" },
        { src = "https://github.com/Civitasv/cmake-tools.nvim", name = "cmake-tools" },
    },
    setup = function()
        local cppman = require("cppman")
        cppman.setup()
        require("clangd_extensions").setup({})
        require("cmake-tools").setup({
            cmake_build_directory = "build/${variant:buildType}",
            cmake_soft_link_compile_commands = true,
            cmake_dap_configuration = { name = "cpp", type = "gdb", request = "launch" },
        })

        vim.keymap.set("n", "<leader>cc", cppman.input, { desc = "Search cppman" })

        -- CMake
        local map = function(lhs, cmd, desc)
            vim.keymap.set("n", lhs, "<cmd>" .. cmd .. "<cr>", { desc = desc })
        end
        map("<leader>mg", "CMakeGenerate", "CMake generate")
        map("<leader>mb", "CMakeBuild", "CMake build")
        map("<leader>mr", "CMakeRun", "CMake run")
        map("<leader>mt", "CMakeSelectLaunchTarget", "CMake select target")
        map("<leader>mT", "CMakeSelectBuildType", "CMake select build type")
        map("<leader>md", "CMakeDebug", "CMake debug target")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserClangd", {}),
            callback = function(e)
                local client = vim.lsp.get_client_by_id(e.data.client_id)
                if not client or client.name ~= "clangd" then
                    return
                end
                local function bmap(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = e.buf, desc = desc })
                end

                -- K: clangd hover; K again while hover is open: cppman page
                bmap("K", function()
                    local win = vim.b.lsp_floating_preview
                    if win and vim.api.nvim_win_is_valid(win) then
                        vim.api.nvim_win_close(win, true)
                        cppman.open_cppman_for(vim.fn.expand("<cword>"))
                    else
                        vim.lsp.buf.hover()
                    end
                end, "Hover (again: cppman)")
                bmap("<leader>cm", function()
                    cppman.open_cppman_for(vim.fn.expand("<cword>"))
                end, "cppman word under cursor")
                bmap("<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", "Switch header/source")
                bmap("<leader>ci", "<cmd>ClangdSymbolInfo<cr>", "Symbol info")
                bmap("<leader>ct", "<cmd>ClangdTypeHierarchy<cr>", "Type hierarchy")
                bmap("<leader>cA", "<cmd>ClangdAST<cr>", "Show AST")
                bmap("<leader>cM", "<cmd>ClangdMemoryUsage<cr>", "clangd memory usage")
            end,
        })

        pcall(function()
            require("which-key").add({
                { "<leader>c", group = "C++ / code" },
                { "<leader>m", group = "CMake" },
                { "<leader>b", group = "Debug" },
            })
        end)
    end,
}
