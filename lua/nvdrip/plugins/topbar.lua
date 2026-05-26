return {
    specs = { src = "https://github.com/utilyre/barbecue.nvim", name = "barbecue" },
    setup = function()
        require("barbecue").setup({
            attach_navic = false,
            theme = {
                normal = { bg = require("catppuccin.palettes").get_palette("mocha").mantle },
            },
        })
    end,
}
