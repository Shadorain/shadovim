--[[ ========================================================================
"    _________.__                .___    ___.   .__            .___      
"   /   _____/|  |__ _____     __| _/____\_ |__ |__| ____    __| _/______
"   \_____  \ |  |  \\__  \   / __ |/  _ \| __ \|  |/    \  / __ |/  ___/
"   /        \|   Y  \/ __ \_/ /_/ (  <_> ) \_\ \  |   |  \/ /_/ |\___ \ 
"  /_______  /|___|  (____  /\____ |\____/|___  /__|___|  /\____ /____  >
"          \/      \/     \/      \/          \/        \/      \/    \/ 
" =========================================================================== ]]
--- Setup {{{
function keymap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local map = keymap
local cmd = vim.cmd
--- }}}
-- [[ General Bindings ]] --------------------------------------------------- ]]
--- Utility {{{
-- Keep screen centered
map('n', 'n', 'nzzzv:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
-- map('n', 'J', 'mzJ\'z')

-- Show cursor
map('n', 'Q', ':lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- Copy to end of line
map('n', 'Y', 'y$')

-- Reverse Join ('J')
-- map('n', '<C-j>', 'ddkPJ')

-- Source Config
map('n', '<C-q>', ':source ~/.config/nvim/init.lua<CR>')

-- Save
map('n', '<C-s>', ':w<CR>')
--- }}}
--- Splits {{{
map('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
map('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
map('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
map('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })

-- Resizing
map('n', '<Up>',    ':resize +2<CR>', { noremap = true, silent = true })
map('n', '<Down>',  ':resize -2<CR>', { noremap = true, silent = true })
map('n', '<Left>',  ':vertical resize +2<CR>', { noremap = true, silent = true })
map('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })

-- Split Management
map('t', '<C-A-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-A-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-A-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-A-l>', '<C-\\><C-N><C-w>l')
map('i', '<C-A-h>', '<esc><C-w>h')
map('i', '<C-A-j>', '<esc><C-w>j')
map('i', '<C-A-k>', '<esc><C-w>k')
map('i', '<C-A-l>', '<esc><C-w>l')
map('n', '<C-A-h>', '<C-w>h')
map('n', '<C-A-j>', '<C-w>j')
map('n', '<C-A-k>', '<C-w>k')
map('n', '<C-A-l>', '<C-w>l')

-- Close + Balance
map('n', 'Ww', '<C-w>c')
map('n', 'Wb', '<C-w>=')
--- }}}
--- Misc {{{
-- Copies/Moves selected text to next split
map('v', '<F3>', 'y<c-w>wp<c-w>gv')
map('v', '<F4>', 'd<c-w>wp<c-w>gv')

-- Turns off line numbers
map('n', '<F3>', ':set invnumber invrelativenumber<CR>')

-- Place semi-colon at EOL
map('i', ';;', '<Esc>A;<Esc>')

-- Moves cursor to next position or further
cmd("inoremap <expr> <C-l> getline('.')[col('.')-1] =~? '[]>)}''\"`]' ? '<Right>' : '<Right>'")
--- }}}
-- [[ Leader / Plugin Bindings ]] ------------------------------------------- ]]
--- No Label {{{
-- Redraw highlights
map('n', '<leader>r', ':nohl<CR>:redraw!<CR>')

--- Treesitter Playground
map('n', '<leader>tht', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })

--- Nvim-UFO {{{
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
--- }}}
--- Hop {{{
map("n", "s", ":HopChar1<cr>", { silent = true })
map("n", "S", ":HopPattern<cr>", { silent = true })

map("o", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
map("o", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
map("o", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
map("o", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

map("n", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
map("n", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
map("n", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
map("n", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)
--- }}}
--- Cybu {{{
map('n', '<C-j>', '<Plug>(CybuNext)', { noremap = true, silent = true })
map('n', '<C-k>', '<Plug>(CybuPrev)', { noremap = true, silent = true })
map('n', '<C-S-j>', '<Plug>(CybuLastusedNext)', { noremap = true, silent = true })
map('n', '<C-S-k>', '<Plug>(CybuLastusedPrev)', { noremap = true, silent = true })
--- }}}
--- Telescope {{{
map('n', '<C-f>',       '<esc><cmd>Telescope find_files<cr>', { noremap = true, silent = true })
map('n', '<C-A-f>',     '<esc><esc><C-w>v<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('i', '<C-f>',       '<esc><cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
--- }}}
--- }}}
--- Which Key {{{
--- Opts {{{
-- Normal Mode Opts
local opts_n = {
  mode = "n",       -- NORMAL mode
  buffer = nil,     -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,    -- use `silent` when creating keymaps
  noremap = true,   -- use `noremap` when creating keymaps
  nowait = true,    -- use `nowait` when creating keymaps
}
-- Visual Mode Opts
local opts_v = {
  mode = "v",       -- VISUAL mode
  buffer = nil,     -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,    -- use `silent` when creating keymaps
  noremap = true,   -- use `noremap` when creating keymaps
  nowait = true,    -- use `nowait` when creating keymaps
}
-- Terminal Mode Opts
local opts_t = {
  mode = "t",       -- TERMINAL mode
  buffer = nil,     -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,    -- use `silent` when creating keymaps
  noremap = true,   -- use `noremap` when creating keymaps
  nowait = true,    -- use `nowait` when creating keymaps
}
--- }}}
--- Mark Mappings {{{
local m_mappings = {
  ["m"] = {
--- Bookmarks {{{
    name = "+bookmarks",
    A = { "<cmd>silent BookmarkAnnotate<cr>",     "Annotate" },
    B = { "<cmd>silent BookmarkToggle<cr>",       "Toggle" },
    C = { "<cmd>silent BookmarkClear<cr>",        "Clear" },
    X = { "<cmd>silent BookmarkClearAll<cr>",     "Clear All" },
    j = { "<cmd>silent BookmarkNext<cr>",         "Next" },
    k = { "<cmd>silent BookmarkPrev<cr>",         "Prev" },
    S = { "<cmd>silent BookmarkShowAll<cr>",      "Show" },
--- }}}
--- Harpoon {{{
    m     = { '<cmd>lua require("harpoon.mark").add_file()<cr>',        "Harpoon" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>',          "Harpoon Next" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>',          "Harpoon Prev" },
    [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
--- }}}
  }
}
--- }}}
--- Normal Mappings {{{
local n_mappings = {
  ["<leader>"] = {
--- Misc {{{
    R = { '<esc><esc>:%s///gcI<left><left><left><left><left>',  "Search/Replace" },
    S = { '<cmd>Startify<CR>',                                  "Startify" },
    i = { '<cmd>TransparentToggle<CR>',                         "Transparency" },
    p = { '<cmd>lua require("peek").Peek("definition")<CR>',    "LSP Peek" },
    J = { '<cmd>JABSOpen<CR>',                                  "JABS Buffers" },
    Z = { '<cmd>lua require("zen-mode").toggle()<CR>',          "Zen Mode" },
--- }}}
--- <T> Telescope {{{
    T = {
      name = "+telescope",
      m     = { "<cmd>Telescope harpoon marks<cr>",         "Search Harpoons" },
      f     = { '<cmd>Telescope find_files',                "Find Files" },
      g     = { '<cmd>Telescope live_grep',                 "Grep" },
      o     = { '<cmd>Telescope oldfiles',                  "Recently Opened" },
      h     = { '<cmd>Telescope help_tags',                 "Nvim help" },
      k     = { '<cmd>Telescope keymaps',                   "Keymaps" },
      C     = { '<cmd>Telescope git_commits',               "Git Commits" },
      r     = { '<cmd>Telescope resume',                    "Resume" },
      p     = { '<cmd>Telescope projects',                  "Projects" },
      H     = { '<cmd>Telescope highlights',                "Highlights" },
      j     = { '<cmd>Telescope jumplist',                  "jumplist" },
      c     = { '<cmd>Telescope commands',                  "Execute" },
      u     = { 'silent! %foldopen! | UndotreeToggle',      "Undotree" },
      ["/"] = { '<cmd>Telescope current_buffer_fuzzy_find', "Search in File" },
      ["?"] = { '<cmd>Telescope search_history',            "History" },
      [";"] = { '<cmd>Telescope command_history',           "Command History" },
    },
--- }}}
--- <s> Session {{{
    s = {
      name = "+session",
      S = { '<cmd>SSave!<CR>',                              "SSave"  },
      s = { '<cmd>SessionManager save_current_session<CR>', "Save"   },
      l = { '<cmd>SessionManager load_session<CR>',         "Load"   },
      L = { '<cmd>SessionManager load_last_session<CR>',    "Recent" },
      d = { '<cmd>SessionManager delete_session<CR>',       "Delete" },
    },
--- }}}
--- <t> Tabs {{{
    t = {
      name = "+tabs",
      t = { '<cmd>tabnew %<CR>',  "New"   },
      c = { '<cmd>tabclose<CR>',  "Close" },
      o = { '<cmd>tabonly<CR>',   "Only"  },
      -- t = { '<cmd>TablineTabNew<CR>', "New" },
      -- r = { '<cmd>TablineTabRename<CR>', "Rename" },
    },
--- }}}
--- <f> File {{{
    f = {
      name = "+file",
      e = { '<cmd>NvimTreeToggle<CR>',                     "Nvim Tree" },
      r = { '<cmd>lua require("lir.float").toggle()<CR>',  "Lir Tree"  },
    },
--- }}}
--- <c> Cargo | Colortils {{{
    c = {
      name = "+cargo|color",
      c = { '<cmd>Cargo build<CR>',        "Build"      },
      c = { '<cmd>Cargo run<CR>',          "Run"        },
      c = { '<cmd>Cargo check<CR>',        "Check"      },
      p = { '<cmd>Colortils picker<CR>',   "Picker"     },
      g = { '<cmd>Colortils gradient<CR>', "Gradient"   },
      d = { '<cmd>Colortils darken<CR>',   "Darken"     },
      l = { '<cmd>Colortils lighten<CR>',  "Lighten"    },
    },
--- }}}
--- <b> Buffer {{{
    b = {
      name = "+buffer",
      l     = { '<cmd>ls<CR>',  "List"   },
      b     = { '<cmd>bn<CR>',  "Next"   },
      n     = { '<cmd>bp<CR>',  "Prev"   },
      k     = { '<cmd>BD<CR>',  "Delete" },
      u     = { '<cmd>BUN<CR>', "Unload" },
      ["1"] = { '<cmd>b 1<CR>', "Buf #1" },
      ["2"] = { '<cmd>b 2<CR>', "Buf #2" },
      ["3"] = { '<cmd>b 3<CR>', "Buf #3" },
      ["4"] = { '<cmd>b 4<CR>', "Buf #4" },
      ["5"] = { '<cmd>b 5<CR>', "Buf #5" },
      ["6"] = { '<cmd>b 6<CR>', "Buf #6" },
      ["7"] = { '<cmd>b 7<CR>', "Buf #7" },
      ["8"] = { '<cmd>b 8<CR>', "Buf #8" },
      ["9"] = { '<cmd>b 9<CR>', "Buf #9" },

      m     = { '<cmd>FloatermToggle<CR>',                          "Float Terminal"  },
      [","] = { '<cmd>FloatermNew --wintype=normal --height=8<CR>', "Bottom Terminal" },
    },
--- }}}
--- <B> Browse {{{
    B = {
      name = "+browse",
      B = { '<cmd>Browse<CR>',                "Search"            },
      i = { '<cmd>BrowseInput<CR>',           "Input"             },
      b = { '<cmd>BrowseBookmarks<CR>',       "Bookmarks"         },
      d = { '<cmd>BrowseDevdocs<CR>',         "Devdocs"           },
      f = { '<cmd>BrowseDevdocsFiletype<CR>', "Devdocs Filetype"  },
      m = { '<cmd>BrowseMdn<CR>',             "Mdn"               },
    },
--- }}}
--- <g> Git {{{
    g = {
      name = "+git",
      g = { '<cmd>LazyGit<CR>',                        "Lazygit"        },
      G = { '<cmd>LazyGitConfig<CR>',                  "Lazygit Cfg"    },
      s = { 
        name = "+gitsigns",
        J = { '<cmd>Gitsigns next_hunk<CR>',             "Next Hunk"      },
        K = { '<cmd>Gitsigns prev_hunk<CR>',             "Prev Hunk"      },
        s = { '<cmd>Gitsigns stage_hunk<CR>',            "Stage Hunk"     },
        p = { '<cmd>Gitsigns preview_hunk<CR>',          "Preview Hunk"   },
        u = { '<cmd>Gitsigns undo_stage_hunk<CR>',       "Undo Stage"     },
        S = { '<cmd>Gitsigns stage_buffer<CR>',          "Stage Buffer"   },
        d = { '<cmd>Gitsigns toggle_deleted<CR>',        "Toggle Deleted" },
        b = { '<cmd>Gitsigns blame_line<CR>',            "Blame Line"     },
        B = { '<cmd>Gitsigns blame_line{full=true}<CR>', "Blame"          },
      },
    },
--- }}}
--- <n> Neogen {{{
    n = {
      name = "+neogen",
      n = { '<cmd>Neogen<CR>',       "Any"      },
      f = { '<cmd>Neogen func<CR>',  "Function" },
      t = { '<cmd>Neogen type<CR>',  "Type"     },
      c = { '<cmd>Neogen class<CR>', "Class"    },
      l = { '<cmd>Neogen file<CR>',  "File"     },
    },
--- }}}
--- <d> Debugging {{{
    d = {
      name = "+debug",
      b     = { '<cmd>lua require("dap").toggle_breakpoint()<CR>',   "Breakpoint"  },
      c     = { '<cmd>lua require("dap").continue()<CR>',            "Continue"    },
      j     = { '<cmd>lua require("dap").down()<CR>',                "Down STrace" },
      k     = { '<cmd>lua require("dap").up()<CR>',                  "Up STrace"   },
      l     = { '<cmd>lua require("dap").run_last()<CR>',            "Run Last"    },
      q     = { '<cmd>lua require("dap").terminate()<CR>',           "Terminate"   },
      u     = { '<cmd>lua require("dapui").toggle()<CR>',            "UI"          },
      K     = { '<cmd>lua require("dap.ui.variables").hover()<CR>',  "Var Hover"   },
      ["{"] = { '<cmd>lua require("dap.ui.variables").scopes()<CR>', "Var Scopes"  },
      s = {
        name = "+step",
        i = { '<cmd>lua require("dap").step_into()<CR>',             "Into" },
        o = { '<cmd>lua require("dap").step_over()<CR>',             "Over" },
        x = { '<cmd>lua require("dap").step_out()<CR>',              "Out"  },
      },
    },
--- }}}
  }
}
--- }}}
--- Visual Mappings {{{
local v_mappings = {
  ["<leader>"] = {
---- Debugging {{{
    d = {
      name = "+debug",
      K = { '<cmd>lua require("dap.ui.variables").visual_hover()<cr>', "Range Hover" },
    },
---- }}}
  }
}
--- }}}
--- Terminal Mappings {{{
local t_mappings = {
  ["<leader>"] = {
---- Floaterm {{{
    b = {
      name = "+floaterm",
      b = { '<C-\\><C-n><cmd>FloatermNext<cr>',   "Next"   },
      n = { '<C-\\><C-n><cmd>FloatermPrev<cr>',   "Prev"   },
      k = { '<C-\\><C-n><cmd>FloatermKill<cr>',   "Close"  },
      m = { '<C-\\><C-n><cmd>FloatermToggle<cr>', "Toggle" },
    },
---- }}}
  }
}
--- }}}
local wk = require("which-key")
wk.register(m_mappings, opts_n)
wk.register(n_mappings, opts_n)
wk.register(v_mappings, opts_v)
wk.register(t_mappings, opts_t)
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
