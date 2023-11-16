local M = {}

M.general = {

  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },

  n = {
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window Right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    -- new buffer
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "LSP formatting",
    },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "Telescope bookmarks" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Lsp code actions",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Lsp code actions",
    },
  },
}

M.fterm = {
  plugin = true,
  n = {
    ["<M-i>"] = {
      function()
        require("FTerm").toggle()
      end,
      "Toggle floating terminal",
    },
  },
  t = {
    ["<M-i>"] = {
      function()
        require("FTerm").toggle()
      end,
      "Toggle floating terminal",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Dap continue",
    },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
  },
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle dap UI",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dtm"] = {
      function()
        require("dap-python").test_method()
      end,
      "Test Python Method",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.jdtls = {
  plugin = true,
  n = {
    ["<leader>ji"] = {
      function()
        require("jdtls").organize_imports()
      end,
      "Organize imports",
    },
    ["<leader>jv"] = {
      function()
        require("jdtls").extract_variable()
      end,
      "Extract variable",
    },
    ["<leader>jc"] = {
      function()
        require("jdtls").extract_constant()
      end,
      "Extract constant",
    },
  },

  x = {
    ["<leader>jv"] = {
      function()
        require("jdtls").extract_variable(true)
      end,
      "Extract variable",
    },
    ["<leader>jc"] = {
      function()
        require("jdtls").extract_constant(true)
      end,
      "Extract constant",
    },
    ["<leader>jm"] = {
      function()
        require("jdtls").extract_method(true)
      end,
      "Extract method",
    },
  },
}

M.dap_jdtls = {
  plugin = true,
  n = {
    ["<leader>dtc"] = {
      function()
        require("jdtls").test_class()
      end,
      "Test java class",
    },
    ["<leader>dtm"] = {
      function()
        require("jdtls").test_nearest_method()
      end,
      "Test java method",
    },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon"
    },
    ["<leader>m"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Add file to harpoon"
    }
  }
}

M.rust_tools = {
  plugin = true,
  n = {
    ["<leader>ca"] = {
      function()
        require("rust-tools").hover_actions().hover_actions()
      end,
      "Rust hover actions",
    }
  }
}

return M
