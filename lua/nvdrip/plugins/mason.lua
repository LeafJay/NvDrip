return {
    specs = {
        { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
        { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", name = "mason-tool-installer" },
    },
    setup = function()
        require("mason").setup({})
        require("mason-tool-installer").setup({
            ensure_installed = {
                "lua-language-server",
                "basedpyright",
                "pyrefly",
                "glsl_analyzer",
                "svelte-language-server",
                "typescript-language-server",
                "json-lsp",
                "tailwindcss-language-server",
                "clangd",
                "neocmakelsp",
                "stylua",
                "black",
                "prettier",
                "clang-format",
                "gersemi",
            },
            run_on_start = true,
            auto_update = false,
        })
    end,
}
