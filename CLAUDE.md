# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, structured as a personal config named `nvdrip`. It uses Neovim 0.12's native `vim.pack` for plugin management.

## Architecture

- `init.lua` — entry point; just calls `require("nvdrip")`
- `lua/nvdrip/init.lua` — sets leader keys, collects all plugin modules, and orchestrates the three-step startup: register build hooks → `vim.pack.add()` → run setup functions
- `lua/nvdrip/core.lua` — vim options and core keymaps (splits, motion, clipboard, etc.)
- `lua/nvdrip/plugins/` — one file per plugin or plugin group; each returns a structured table

## Plugin conventions

Every file in `lua/nvdrip/plugins/` returns a table with up to three keys:

```lua
return {
  specs = { { src = "https://github.com/owner/repo", name = "...", version = "..." }, ... },
  hooks = { { match = "plugin-name", cmd = "ex-cmd" } },  -- PackChanged build hooks
  setup = function() require("plugin").setup({...}) end,
}
```

- `specs`: vim.pack spec(s) with full GitHub URL. Shared deps (e.g. `nvim-web-devicons`) are declared in one file only; `init.lua` deduplicates by `src`.
- `hooks`: registered as `PackChanged` autocmds **before** `vim.pack.add()` fires — used for build steps (TSUpdate, cmake, npm).
- `setup`: called **after** `vim.pack.add()`. Plugin load order is controlled by the explicit `plugin_modules` list in `lua/nvdrip/init.lua`.

To add a plugin: create a new file in `lua/nvdrip/plugins/` and add its module path to `plugin_modules` in `lua/nvdrip/init.lua`. Order matters — catppuccin must come before topbar (which reads the catppuccin palette at setup time), and navic before lsp/topbar (which attach it).

LSP servers are enabled explicitly in `plugins/lsp.lua` via `vim.lsp.enable({...})`. Mason (`plugins/mason.lua`) handles LSP/tool installation but has no auto-install config — servers must be installed manually via `:Mason`.

## Key plugins

| Plugin | File | Purpose |
|---|---|---|
| nvim-lspconfig | `lsp.lua` | LSP setup; enabled servers: lua_ls, basedpyright, glsl_analyzer, svelte, ts_ls, jsonls, tailwindcss, clangd |
| rustaceanvim | `rust.lua` | Rust LSP (replaces rust-analyzer config in lspconfig) |
| blink.cmp | `blink.lua` | Completion (keymap preset: `enter` to accept) |
| conform.nvim | `format.lua` | Formatting; `<leader>fm` formats buffer; Python uses `black` |
| telescope.nvim | `telescope.lua` | Fuzzy finding (fzf-native requires cmake at build time via PackChanged hook) |
| oil.nvim | `oil.lua` | File explorer (`<leader>e`) |
| treesitter | `treesitter.lua` | Syntax; `:TSUpdate` runs via PackChanged hook on install |
| catppuccin | `catppuccin.lua` | Colorscheme (mocha flavor); must be first in plugin_modules |
| barbecue + navic | `topbar.lua` / `navic.lua` | Breadcrumb bar; navic+navbuddy attached manually in LspAttach |
| navbuddy | `navic.lua` / `lsp.lua` | Symbol navigator (`<leader>fs`); specs in navic.lua, attach in lsp.lua |
| which-key | `whichkey.lua` | Keymap discovery |
| lualine | `line.lua` | Status line; also registers nvim-web-devicons spec (shared dep) |
| strudel.nvim | `strudel.lua` | Requires `npm install` at build time via PackChanged hook |

## Keymaps reference

Defined in `core.lua` and plugin `setup` functions:

- `<leader>` = Space
- `<leader>t` / `<leader>T` — vertical / horizontal split
- `<leader>q` — close window
- `<leader>e` — Oil file explorer
- `<leader>ff/fa/fb/fw/fd` — Telescope finders
- `<leader>fs` — navbuddy symbol navigator
- `<leader>fm` — format buffer
- `<leader>rn` / `<leader>ca` — LSP rename / code action
- `gd/gD/gr/gi/K/<C-k>` — LSP navigation (set in LspAttach)
- `[d` / `]d` — previous/next diagnostic
