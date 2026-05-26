return {
    specs = {
        { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    },
    setup = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                themes = "catpuccin",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {},
                lualine_c = { "branch", "diff", "diagnostics" },
                lualine_x = { "encoding", "filetype", "progress", "location" },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
