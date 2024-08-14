local opt = vim.opt
local g = vim.g
local fn = vim.fn

fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticSignError", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticSignHint", texthl = "DiagnosticSignHint" })

-------------------------------------- options ------------------------------------------

g.loaded_netrwPlugin = 1
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

g.mapleader = " "

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "ruby" }) do
    g["loaded_" .. provider .. "_provider"] = 0
end

vim.keymap.set("n", "<leader>t", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>close<cr>")
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })

vim.keymap.set({ "n", "x" }, "j", function()
    return vim.v.count > 0 and "j" or "gj"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
    return vim.v.count > 0 and "k" or "gk"
end, { noremap = true, expr = true })


local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})
