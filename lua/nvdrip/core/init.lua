local opt = vim.opt
local g = vim.g
local fn = vim.fn

---------------------------------------- ui ----------------------------------------------

fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticSignError", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticSignHint", texthl = "DiagnosticSignHint" })

-------------------------------------- options ------------------------------------------
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
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  g["loaded_" .. provider .. "_provider"] = 0
end
-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd("FileType", {
  pattern = { "c", "cpp", "cs", "java", "sh", "py" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.o.expandtab = false
  end,
  desc = "Set shiftwidth to 4 in these filetypes",
})

-------------------------------------- keymaps ------------------------------------------
vim.keymap.set({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { silent = true })

vim.keymap.set("n", "<Esc>", ":noh <CR>", { silent = true })
