--[[ ========================================================================
"   _________                _____.__           .__                
"   _   ___ \  ____   _____/ ____\__| ____     |  |  __ _______   
"  /    \  \/ /  _ \ /    \   __\|  |/ ___\    |  | |  |  \__  \  
"  \     \___(  <_> )   |  \  |  |  / /_/  >   |  |_|  |  // __ \_
"   \______  /\____/|___|  /__|  |__\___  / /\ |____/____/(____  /
"          \/            \/        /_____/  \/                 \/
" =========================================================================== ]]
local cmd = vim.cmd
-- [[ General Settings ]] --------------------------------------------------- ]]
-- {{{
--- Leader key {{{
vim.g.mapleader = " "
vim.g.maplocalleader = ','
--- }}}
--- Tab Configuration {{{
vim.cmd('set expandtab')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
cmd('au FileType norg set shiftwidth=2')
cmd('au FileType norg set tabstop=2')
cmd('au FileType norg set softtabstop=2')
cmd('au FileType lua set shiftwidth=2')
cmd('au FileType lua set tabstop=2')
cmd('au FileType lua set softtabstop=2')
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
--- }}}
--- Numbering {{{
vim.opt.number = true
vim.opt.relativenumber = true
--- }}}
--- Misc {{{
vim.opt.path = '$PWD/**'
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.conceallevel = 2
vim.opt.listchars = 'space:·'
vim.opt.virtualedit = "block"
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
vim.opt.ruler = true
vim.opt.inccommand = "split"

-- Vim Spell
cmd('au FileType markdown setlocal spell spelllang=en_us')
cmd('au FileType norg setlocal spell spelllang=en_us')

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.laststatus = 2

-- Undo
vim.opt.undofile = true
vim.opt.undodir = "/home/shadow/.local/cache/nvim/undo/"
vim.opt.backupdir= "/home/shadow/.local/cache/nvim/backups/"

-- Pumemu
vim.opt.pumwidth = 15
vim.opt.pumheight = 7
vim.opt.pumblend = 20
vim.opt.winblend = 20

-- Update times
vim.opt.updatetime = 150

-- Cursor Line Nr
cmd('set cursorline')
cmd('set cursorlineopt=number')

cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

cmd('set autoread')

-- Ctags
vim.cmd [[ autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi ]]
vim.cmd [[ autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw! ]]
--- }}}
-- }}}
-- [[ Plugin Settings ]] ---------------------------------------------------- ]]
-- {{{
--- Floaterm {{{
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.5
vim.g.floaterm_height = 0.4
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1
vim.g.floaterm_title = 0
--- }}}
--- Crates {{{
local null_ls = require('null-ls')
require('crates').setup {
     null_ls = { enabled = true, name = "crates.nvim", },
}
--- }}}
--- Comment {{{
require('Comment').setup()
--- }}}
--- Illuminate {{{
vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree', 'Startify'}
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
--- }}}
--- Cmp {{{
-- Icons {{{
local kind_icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}
-- }}}
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup {
  preselect = cmp.PreselectMode.None,
  completion = { completeopt = "menu,menuone,noselect,noinsert" },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  mapping = {
    ["<C-j>"]     = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ["<C-n>"]     = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ["<C-d>"]     = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-u>"]     = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-c>"]     = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ['<CR>']      = cmp.mapping.confirm { select = true, },
    ['<Tab>']     = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else fallback()
      end
    end, { "i", "s", }),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else fallback()
      end
    end, { "i", "s", }),
    ['<C-l>'] = cmp.mapping(function()
      if has_words_before() and luasnip.expand_or_jumpable() then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '', true)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Right>', true, true, true), '', true)
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '', true)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left>', true, true, true), '', true)
      end
    end, { 'i', 's' }),
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	  winhighlight = 'FloatBorder:TelescopeBorder',  
    },
  },
  sources = {
    { name = "luasnip"  }, { name = "nvim_lua" },
    { name = "nvim_lsp" }, { name = "calc" },
    { name = "path"     }, { name = "buffer" },
    { name = "neorg"    }, { name = "cmp_tabnine" },
    { name = "cmdline"  }, { name = "ctags" },
    { name = "crates" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "",
        nvim_lua = "",
        luasnip = "",
        buffer = "",
        path = "",
      })[entry.source.name]
      return vim_item
    end,
    -- format = lspkind.cmp_format({with_text=true, menu = ({
    --   buffer = "[B]",
    --   nvim_lsp = "[L]",
    --   luasnip = "[S]",
    --   calc = "[C]",
    --   path = "[P]",
    --   neorg = "[N]",
    --   cmp_tabnine = "[T]",
    --   }),
    -- -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- }),
  },
  experimental = { ghost_text = true, custom_menu = true }
}
--- }}}
--- Symbols Outline {{{
vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = "right",
  width = 25,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  keymaps = {
    close = "q",
    goto_location  = "<CR>",
    focus_location = "<space>",
    hover_symbol   = "K",
    toggle_preview = "p",
    rename_symbol  = "r",
    code_actions   = "a",
  },
}
--- }}}
--- Todo Comments {{{
require("todo-comments").setup {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}
--- }}}
--- Git Signs {{{
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = { -- Default keymap options
    noremap = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = { interval = 1000, follow_files = true },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter_opts = { relative_time = false },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  -- diff_opts = { internal = true, }, -- use_internal_diff = true,  -- If vim.diff or luajit is present
  yadm = { enable = false },
}
--- }}}
--- AutoPairs {{{
vim.cmd [[
  let g:AutoPairsFlyMode = 0
  let g:AutoPairsShortcutBackInsert = '<M-C-v>'
  let g:AutoPairsShortcutFastWrap = '<M-S-n>'
  let g:AutoPairsMapCh = 0
  let g:AutoPairsMoveCharacter = "()[]{}\"'"
  au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', '\W\zs|': '|', '/*': '*/', "\W\zs\'": ''})
  au FileType c,cpp let b:AutoPairs = AutoPairsDefine({'<': '>', '/*': '*/', "\W\zs\'": ''})
]]
--- }}}
--- Neorg {{{
require('neorg').setup {
  load = {
	["core.defaults"] = {}, -- Load all the defaults
	["core.norg.concealer"] = {}, -- Allows the use of icons
	["core.keybinds"] = { config = { default_keybinds = true, neorg_leader = "<leader>o" } },
	["core.gtd.base"] = { config = { workspace = "gtd" } },
	["core.integrations.treesitter"] = {
      config = {
        highlights = {
          Unordered = {
            List = {
              ["1"] = "+NeorgHeading1Title", ["2"] = "+NeorgHeading2Title",
              ["3"] = "+NeorgHeading3Title", ["4"] = "+NeorgHeading4Title",
              ["5"] = "+NeorgHeading5Title", ["6"] = "+NeorgHeading6Title",
            },
            Link = {
              ["1"] = "+htmlh1", ["2"] = "+htmlh2",
              ["3"] = "+htmlh3", ["4"] = "+htmlh4",
              ["5"] = "+htmlh5", ["6"] = "+htmlh6",
            },
          },
          Ordered = {
            List = {
              ["1"] = "+NeorgHeading1Title", ["2"] = "+NeorgHeading2Title",
              ["3"] = "+NeorgHeading3Title", ["4"] = "+NeorgHeading4Title",
              ["5"] = "+NeorgHeading5Title", ["6"] = "+NeorgHeading6Title",
            },
            Link = {
              ["1"] = "+htmlh1", ["2"] = "+htmlh2",
              ["3"] = "+htmlh3", ["4"] = "+htmlh4",
              ["5"] = "+htmlh5", ["6"] = "+htmlh6",
            },
          },
          Quote = {
            ["1"] = { [""] = "+htmlH1", Content = "+htmlH1" },
            ["2"] = { [""] = "+htmlH2", Content = "+htmlH2" },
            ["3"] = { [""] = "+htmlH3", Content = "+htmlH3" },
            ["4"] = { [""] = "+htmlH4", Content = "+htmlH4" },
            ["5"] = { [""] = "+htmlH5", Content = "+htmlH5" },
            ["6"] = { [""] = "+htmlH6", Content = "+htmlH6" },
          },
          Definition = {
              [""] = "+Exception",
              End = "+Exception",
              Title = "+TSStrong",
              -- TODO: figure out odd highlighting of ranged tag when using TSNone
              Content = "+TSEmphasis",
          },
          TodoItem = {
            ["1"] = {
              [""] = "+NeorgUnorderedList1",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
            ["2"] = {
              [""] = "+NeorgUnorderedList2",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
            ["3"] = {
              [""] = "+NeorgUnorderedList3",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
            ["4"] = {
              [""] = "+NeorgUnorderedList4",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
            ["5"] = {
              [""] = "+NeorgUnorderedList5",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
            ["6"] = {
              [""] = "+NeorgUnorderedList6",
              Undone = "+StringDelimiter",
              Pending = "+TSPunctDelimiter",
              Done = "+TSString",
            },
          },
          EscapeSequence = "+TSType",
          StrongParagraphDelimiter = "+Comment",
          WeakParagraphDelimiter = "+Comment",
          HorizontalLine = "+htmlH4",
          Marker = { [""] = "+Structure", Title = "+TSStrong" },
          Tag = {
            Begin = "+TSKeyword",
            ["End"] = "+TSKeyword",
            Name = { [""] = "+Normal", Word = "+TSKeyword" },
            Parameter = "+TSType",
            Content = "+Normal",
          },
          Insertion = {
            [""] = "cterm=bold gui=bold",
            Prefix = "+TSPunctDelimiter",
            Variable = {
              [""] = "+TSString",
              Value = "+TSPunctDelimiter",
            },
            Item = "+TSNamespace",
            Parameters = "+TSComment",
          },
          EscapeSequence = "+TSType",
        }
      }
    },
    ["core.norg.dirman"] = { -- Manage Neorg directories
	  config = {
	    workspaces = {
		  main   = "~/dev/neorg",
		  work   = "~/dev/neorg/work",
		  school = "~/dev/neorg/school",
	    },
	    autochdir = false,
	    autodetect = false
	  }
    },
    -- ["core.integrations.telescope"] = {},
    ["core.norg.completion"] = { config = { engine = "nvim-cmp", } },
  },
  logger = { level = "warn" },
}
--- }}}
--- Treesitter {{{
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main"
  },
}
parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}
parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
}
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "rust", "bash", "comment", "lua", "norg", "norg_meta", "norg_table" },
  rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = 1000,
	colors = { '#B52A5B', '#FF4971', '#bd93f9', '#E9729D', '#F18FB0', '#8897F4', '#b488bf' },  
  },
  highlight = { enable = true },
  incremental_selection = {
	enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnn",
      scope_incremental = "gns",
      node_decremental = "gnp",
    },
  },
  indent = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  textsubjects = {
    enable = true,
    keymaps = { [','] = 'textsubjects-smart', }
  },
  -- autopairs = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["il"] = "@loop.outer",
        ["al"] = "@loop.outer",
        ["icd"] = "@conditional.inner",
        ["acd"] = "@conditional.outer",
        ["acm"] = "@comment.outer",
        ["ast"] = "@statement.outer",
        ["isc"] = "@scopename.inner",
        ["iB"] = "@block.inner",
        ["aB"] = "@block.outer",
        ["p"] = "@parameter.inner",
      },
    },
	move = {
      enable = true,
      set_jumps = true, -- Whether to set jumps in the jumplist
      goto_next_start = {
        ["gnf"] = "@function.outer",
        ["gnif"] = "@function.inner",
        ["gnp"] = "@parameter.inner",
        ["gnc"] = "@call.outer",
        ["gnic"] = "@call.inner",
      },
      goto_next_end = {
        ["gnF"] = "@function.outer",
        ["gniF"] = "@function.inner",
        ["gnP"] = "@parameter.inner",
        ["gnC"] = "@call.outer",
        ["gniC"] = "@call.inner",
      },
      goto_previous_start = {
        ["gpf"] = "@function.outer",
        ["gpif"] = "@function.inner",
        ["gpp"] = "@parameter.inner",
        ["gpc"] = "@call.outer",
        ["gpic"] = "@call.inner",
      },
      goto_previous_end = {
        ["gpF"] = "@function.outer",
        ["gpiF"] = "@function.inner",
        ["gpP"] = "@parameter.inner",
        ["gpC"] = "@call.outer",
        ["gpiC"] = "@call.inner",
      },
    },
  },
  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'I',
      toggle_language_display = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  tree_docs = { enable = false }, -- Currently experimental, doesn't work well
  context_commentstring = { enable = true },
}
--- }}}
--- Telescope {{{
---- Dont preview binary files
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
end

require('telescope').load_extension('projects')

local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading',
          '--with-filename', '--line-number',
          '--column', '--smart-case'
        },
        results_title = false,
        preview_title = false,
        prompt_prefix = "❱ ",
        selection_caret = "❱ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.8, height = 0.5,
            prompt_position = "bottom",
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = { "target", "build", "bin" },
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        border = {},
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }, 
        winblend = 20,
        previewer = true,
        color_devicons = true,
        use_less = false,
        set_env = { ['COLORTERM'] = 'truecolor' },
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}
--- }}}
--- IndentBlankLine {{{
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_blankline_indent = 0
vim.g.indent_blankline_show_first_indent_level = 0
vim.g.indent_blankline_use_treesitter = 1
vim.g.indent_blankline_use_treesitter_scope = 1
vim.g.indent_blankline_show_current_context = 1
vim.g.indent_blankline_show_current_context_start = 0
vim.g.indent_blankline_context_highlight_list = { 'Define' }

vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer", "norg" }
vim.g.indent_blankline_buftype_exclude =  { "terminal", "norg", "TelescopePrompt", "Startify" }
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = false,
  char_highlight_list = {
    "IndentBlanklineIndent1", "IndentBlanklineIndent2",
    "IndentBlanklineIndent3", "IndentBlanklineIndent4",
    "IndentBlanklineIndent5", "IndentBlanklineIndent6",
  },
}
--- }}}
--- Project {{{
require('project_nvim').setup({
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "Cargo.toml", ".hg", ".bzr", ".svn", "Makefile" },
})
--- Null-LS {{{
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup {
  debug = false,
  cmd = { "nvim" },
  debounce = 250,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote" },
    },
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.completion.tags,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.cppcheck,
    -- null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.rustfmt,
  },
  update_in_insert = false,
}
--- }}}
--- }}}
--- Vim Bookmarks {{{
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_save_per_working_dir = 1
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>BookmarkShowAll', { noremap = true })
--- }}}
--- Lualine {{{
require'lualine'.setup {
    options = {
        theme = 'shado',
        icons_enabled = true,
        disabled_filetypes = {},
        section_separators   = { '', '' },
        component_separators = { '', '' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'}, --, {'diff', color_added='#37d4a7', color_modified='#2f77a1',
            -- color_removed='#de286e', symbols = {added = '', modified = '', removed = ''} }},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'location'},
        lualine_z = {},
    },
    tabline = {},
    extensions = {'quickfix'},
}
--- }}}
--- Tabline {{{
require'tabline'.setup {
  enable = true,
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''},
    max_bufferline_percent = 66,
    show_tabs_always = true,
    show_devicons = true,
    show_bufnr = false,
    show_filename_only = true,
  }
}
vim.cmd [[
  set guioptions-=e
  set sessionoptions+=tabpages,globals
]]
--- }}}
--- Startify {{{
vim.g.startify_session_dir = '/home/shadow/.local/cache/nvim/session/'
vim.g.startify_enable_special = 0

vim.g.startify_lists = {
    { type = 'sessions',  header = {'    Sessions'}                              },
    { type = 'bookmarks', header = {'    Bookmarks'}                             },
    { type = 'files',     header = {'    Files'}                                 },
    { type = 'dir',       header = {'    Current Directory ' .. vim.fn.getcwd()} },
}

vim.g.startify_bookmarks = {
    { nv = '~/.config/nvim/init.lua'           },
    { np = '~/.config/nvim/lua/plugins.lua'    },
    { nc = '~/.config/nvim/lua/config.lua'     },
    { nk = '~/.config/nvim/lua/binds.lua'      },
    { nm = '~/.config/nvim/lua/mod.lua'        },
    { nl = '~/.config/nvim/lua/lsp_config.lua' },
    { ns = '~/.config/nvim/colors/shado.vim'   },
    { nx = '~/.config/nvim/colors/shado.vim'   },
    { x  = '~/.xmonad/xmonad.hs'               },
    { p  = '~/.config/shadobar/config-xmonad'  },
    { c  = '~/.config/picom.conf'              },
    { za = '~/.zsh_aliases'                    },
    { zc = '~/.zshrc'                          },
    { ze = '~/.zshenv'                         },
}

vim.g.startify_custom_header = vim.split([[ 
#||>================---------------------------------------------================<||#
 \"      _________  __                  ___                        __             "/       
  "     /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____      " 
  "     \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \     " 
  "     /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \    " 
  "    /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /    " 
 /"            \/       \/      \/      \/                    \/          \/      "\
#||>================---------------------------------------------================<||#
    ]], "\n", true)
--- }}}
--- Quick Scope {{{
cmd("let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T']")
--- }}}
--- Termdebug {{{
cmd('packadd! termdebug')
vim.g.termdebug_wide = 1
--- }}}
--- Specs {{{
require('specs').setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 15, -- time increments used for fade/resize effects 
        blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,
        winhl = "Beacon",
        fader = require('specs').pulse_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = { nofile = true, },
}
--- }}}
--- Transparent {{{
require("transparent").setup({
    enable = true,
    extra_groups = {},
    exclude = {},
})
--- }}}
--- DAP {{{
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.external_terminal = {
  command = '/usr/local/bin/st';
  args = {''};
}
--- }}}
--- DAP UI {{{
vim.fn.sign_define('DapBreakpoint', {text="", texthl='DiagnosticSignError', linehl='', numhl=''})
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
    -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        { id = "breakpoints", size = 0.15 },
        { id = "scopes", size = 0.65, }, -- Can be float or integer > 1
        { id = "stacks", size = 0.25 },
        -- { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = { },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = { close = { "q", "<Esc>" }, },
  },
  windows = { indent = 1 },
})
-- }}}
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
