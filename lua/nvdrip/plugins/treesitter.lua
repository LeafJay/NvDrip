return {
    specs = { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
    hooks = {
        { match = "nvim-treesitter", cmd = "TSUpdate" },
    },
    setup = function()
        require("nvim-treesitter").setup({})
        pcall(function()
            require("nvim-treesitter").install({
                "lua", "python", "rust", "glsl", "svelte",
                "typescript", "javascript", "tsx", "json",
                "css", "html", "c", "cpp",
                "cmake", "make", "ninja",
                "vim", "vimdoc", "markdown", "markdown_inline", "bash",
            })
        end)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
