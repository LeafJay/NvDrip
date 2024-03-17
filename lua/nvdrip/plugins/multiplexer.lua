-- return {
--     'Lilja/zellij.nvim',
--     config = function()
--         require('zellij').setup({
--             vimTmuxNavigatorKeybinds = true,
--         })
--     end
-- }
return {
    "aserowy/tmux.nvim",
    config = function()
        require("tmux").setup()
    end
}
