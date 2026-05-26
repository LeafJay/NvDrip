require("nvdrip.core")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugin modules in explicit load order.
-- Order matters for setup() calls: catppuccin must run before topbar (which
-- reads the catppuccin palette), and navic before lsp/topbar (which attach it).
-- nvim-web-devicons spec is registered in line.lua (used by oil and topbar too).
local plugin_modules = {
    "nvdrip.plugins.catppuccin",
    "nvdrip.plugins.navic",
    "nvdrip.plugins.line",
    "nvdrip.plugins.autopairs",
    "nvdrip.plugins.blink",
    "nvdrip.plugins.cursorfx",
    "nvdrip.plugins.format",
    "nvdrip.plugins.gitconflict",
    "nvdrip.plugins.lsp",
    "nvdrip.plugins.mason",
    "nvdrip.plugins.minisurround",
    "nvdrip.plugins.oil",
    "nvdrip.plugins.rust",
    "nvdrip.plugins.strudel",
    "nvdrip.plugins.telescope",
    "nvdrip.plugins.tmux",
    "nvdrip.plugins.topbar",
    "nvdrip.plugins.treesitter",
    "nvdrip.plugins.whichkey",
}

local all_specs, all_hooks, all_setups = {}, {}, {}
local seen = {}

for _, modname in ipairs(plugin_modules) do
    local mod = require(modname)

    -- Normalize specs: single spec → list
    local specs = mod.specs
    if type(specs) == "string" or (type(specs) == "table" and specs.src) then
        specs = { specs }
    end
    for _, s in ipairs(specs or {}) do
        local key = type(s) == "string" and s or s.src
        if not seen[key] then
            seen[key] = true
            table.insert(all_specs, s)
        end
    end

    for _, h in ipairs(mod.hooks or {}) do
        table.insert(all_hooks, h)
    end

    if mod.setup then
        table.insert(all_setups, mod.setup)
    end
end

-- Step 1: Register PackChanged build hooks BEFORE vim.pack.add()
for _, h in ipairs(all_hooks) do
    vim.api.nvim_create_autocmd("PackChanged", {
        pattern = h.match,
        callback = function()
            if h.fn then
                h.fn()
            elseif h.cmd then
                vim.cmd(h.cmd)
            end
        end,
    })
end

-- Step 2: Install/load all plugins
vim.pack.add(all_specs)

-- Step 3: Configure plugins in order
for _, fn in ipairs(all_setups) do
    local ok, err = pcall(fn)
    if not ok then
        vim.notify("Plugin setup error: " .. tostring(err), vim.log.levels.ERROR)
    end
end
