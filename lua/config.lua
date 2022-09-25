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
vim.opt.showtabline = 0
vim.opt.timeoutlen = 500

-- Buffer menu
cmd('set wildchar=<Tab> wildmenu wildmode=full')

-- Sessin management
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Vim Spell
cmd('au FileType markdown setlocal spell spelllang=en_us')
-- cmd('au FileType norg setlocal spell spelllang=en_us')

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

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
--- Icons {{{
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
local type_icons = {
  Array = " ",
  Number = " ",
  String = " ",
  Boolean = "蘒",
  Object = " ",
}
local documents_icons = {
  File = " ",
  Files = " ",
  Folder = " ",
  OpenFolder = " ",
}
local git_icons = {
  Add = " ",
  Mod = " ",
  Remove = " ",
  Ignore = " ",
  Rename = " ",
  Diff = " ",
  Repo = " ",
  Octoface = "",
}
local ui_icons = {
  ArrowClosed = " ",
  ArrowOpen = " ",
  Lock = " ",
  Circle = " ",
  BigCircle = " ",
  BigUnfilledCircle = " ",
  Close = " ",
  NewFile = " ",
  Search = " ",
  Lightbulb = " ",
  Project = " ",
  Dashboard = " ",
  History = " ",
  Comment = " ",
  Bug = " ",
  Code = "",
  Telescope = " ",
  Gear = " ",
  Package = " ",
  List = " ",
  SignIn = " ",
  SignOut = " ",
  Check = " ",
  Fire = " ",
  Note = " ",
  BookMark = " ",
  Pencil = " ",
  -- ChevronRight = " ",
  ChevronRight = "> ",
  Table = " ",
  Calendar = " ",
  CloudDownload = " ",
}
local diagnostics_icons = {
  Error = " ",
  Warning = " ",
  Information = " ",
  Question = " ",
  Hint = " ",
}
local misc_icons = {
  Robot = "ﮧ ",
  Squirrel = " ",
  Tag = " ",
  Watch = " ",
  Smiley = "ﲃ ",
  Package = " ",
  Rust = ' ',
}
--- }}}
--- * Documenting * {{{
--- Neogen {{{
local status_ok, neogen = pcall(require, "neogen")
if status_ok then
  neogen.setup {}
end
--- }}}
--- Todo Comments {{{
local status_ok, todo_comments = pcall(require, "todo-comments")
if status_ok then
  todo_comments.setup {
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
end
--- }}}
--- Comment {{{
local status_ok, comment = pcall(require, "Comment")
if status_ok then
  comment.setup()
end
--- }}}
--- Vim Bookmarks {{{
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_save_per_working_dir = 1
--- }}}
--- }}}
--- * Code * {{{
--- Cmp {{{
local status_ok, cmp = pcall(require, "cmp")
if status_ok then
  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#4484d1" })
  vim.api.nvim_set_hl(0, "CmpItemKindNvimLsp", { fg = "#6161b3" })
  vim.api.nvim_set_hl(0, "CmpItemKindCrate",   { fg = "#F64D00" })

  local compare = require('cmp.config.compare')
  local luasnip = require('luasnip')
  vim.defer_fn(function()
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
      select = true,
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
        elseif neogen.jumpable() then
          neogen.jump_next()
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
        elseif neogen.jumpable(true) then
          neogen.jump_prev()
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
        max_height = 30,
        max_width = 100,
        width = 80,
        height = 20,
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	      winhighlight = 'FloatBorder:TelescopeBorder',  
      },
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	      winhighlight = 'FloatBorder:VertSplit',  
      },
    },
    sources = {
      { name = "nvim_lsp", group_index = 2 },
      { name = "copilot",
        max_item_count = 3,
        trigger_characters = {
          { ".", ":", "(", "'", '"', "[", ",", "#", "*", "@", "|", "=", "-", "{", "/", "\\", "+", "?" },
        },
        group_index = 2
      },
      { name = "cmp_tabnine", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "crates", group_index = 1 },
      { name = "ctags", group_index = 2 },
      { name = "nvim_lua", group_index = 2 },
      { name = "calc", group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "neorg", group_index = 2 },
      { name = "cmdline", group_index = 2 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        require("copilot_cmp.comparators").prioritize,
        require("copilot_cmp.comparators").score,
        compare.offset,
        compare.exact,
        -- compare.scopes,
        compare.score,
        compare.recently_used,
        compare.locality,
        -- compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    formatting = {
      -- fields = { "kind", "abbr", "menu" },
      fields = { "kind", "abbr" },
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.menu = ({
        -- 	copilot = git_icons.Octoface,
        -- 	nvim_lsp = ui_icons.Code,
        -- 	cmp_tabnine = misc_icons.Robot,
        -- 	crates = misc_icons.Rust,
        -- 	ctags = misc_icons.Tag,
        -- 	luasnip = ui_icons.Pencil,
        -- 	buffer = "[B]",
        -- 	calc = "[+]",
        -- 	path = "[/]",
        -- 	neorg = "[N]",
        -- 	cmdline = "[>]",
        -- })[entry.source.name]
        -- if entry.source.name == "copilot" then
        --   vim_item.menu_hl_group = "CmpItemKindCopilot"
        -- end
        -- if entry.source.name == "nvim_lsp" or "luasnip" then
        --   vim_item.menu_hl_group = "CmpItemKindNvimLsp"
        -- end
        -- if entry.source.name == "cmp_tabnine" then
        --   vim_item.menu_hl_group = "CmpItemKindTabnine"
        -- end
        -- if entry.source.name == "crates" then
        --   vim_item.menu_hl_group = "CmpItemKindCrate"
        -- end
        return vim_item
      end,
    },
    experimental = { ghost_text = true } --,  custom_menu = true }
  }
  end, 100)
end
--- }}}
--- Treesitter {{{
local status_ok, treesitter = pcall(require, "nvim-treesitter")
if status_ok then
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
    ensure_installed = { "c", "cpp", "rust", "bash", "comment", "norg", "norg_meta", "norg_table" }, --, "lua"
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
end
--- }}}
--- Copilot {{{
local status_ok, copilot_cmp = pcall(require, "copilot-cmp")
if status_ok then
  require("copilot-cmp").setup {
    method = "getCompletionsCycling",
    force_autofmt = false,
    formatters = {
      label = require("copilot_cmp.format").format_label_text,
      insert_text = require("copilot_cmp.format").format_label_text,
      preview = require("copilot_cmp.format").deindent,
    },
  }
end
--- }}}
--- Null-LS {{{
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
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
end
--- }}}
--- Crates {{{
local status_ok, crates = pcall(require, "crates")
if status_ok then
  local null_ls = require('null-ls')
  crates.setup {
       null_ls = { enabled = true, name = "crates.nvim", },
  }
end
--- }}}
--- AutoPairs {{{
local status_ok, npairs = pcall(require, "nvim-autopairs")
if status_ok then
  npairs.setup {
    check_ts = true,
    ts_config = { },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-f>",
      chars = { "{", "[", "(", '"', "'", "<" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }

  local Rule = require('nvim-autopairs.rule')
  npairs.add_rule(Rule("<", ">", "rust"))

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end
end
--- }}}
--- Renamer {{{
vim.api.nvim_set_keymap(
	"i",
	"<F2>",
	'<cmd>lua require("renamer").rename({empty = true})<cr>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<F2>",
	'<cmd>lua require("renamer").rename({empty = true})<cr>',
	{ noremap = true, silent = true }
)
local mappings_utils = require("renamer.mappings.utils")
require('renamer').setup({
	title = "Rename",
	padding = { top = 0, left = 0, bottom = 0, right = 0 },
	border = true,
	border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	-- Whether or not to highlight the current word references through LSP
	show_refs = true,
	-- The keymaps available while in the `renamer` buffer. The example below
	-- overrides the default values, but you can add others as well.
	mappings = {
		["<c-i>"] = mappings_utils.set_cursor_to_start,
		["<c-a>"] = mappings_utils.set_cursor_to_end,
		["<c-e>"] = mappings_utils.set_cursor_to_word_end,
		["<c-b>"] = mappings_utils.set_cursor_to_word_start,
		["<c-c>"] = mappings_utils.clear_line,
		["<c-u>"] = mappings_utils.undo,
		["<c-r>"] = mappings_utils.redo,
	},
})
--- }}}
--- Aerial {{{
local status_ok, aerial = pcall(require, "aerial")
if status_ok then
  aerial.setup {
    manage_folds = true,
    link_tree_to_folds = true,
    link_folds_to_tree = true,
    show_guides = true,
  }
end
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
--- LSP Lines {{{
local status_ok, lsp_lines = pcall(require, "lsp_lines")
if status_ok then
  lsp_lines.setup()
end
--- }}}
--- }}}
--- }}}
--- * Editing * {{{
--- Which-Key {{{
local status_ok, which_key = pcall(require, "which-key")
if status_ok then
  which_key.setup {
    plugins = {
      marks = true,         -- shows a list of your marks on ' and `
      registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,     -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 10,   -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false,      -- adds help for motions
        text_objects = true,  -- help for text objects triggered after entering an operator
        windows = true,       -- default bindings on <c-w>
        nav = true,           -- misc bindings to work with windows
        z = true,             -- bindings for folds, spelling and others prefixed with z
        g = true,             -- bindings for prefixed with g
      },
    },
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      ["<leader>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "» ", -- symbol used in the command line area that shows your active key combo
      separator = "➜ ",  -- symbol used between a key and it's label
      group = "+",       -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = '<c-d>',  -- binding to scroll down inside the popup
      scroll_up = '<c-u>',    -- binding to scroll up inside the popup
    },
    window = {
      border = "none",          -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
      align = "center",               -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }
end
--- }}}
--- Hop {{{
local status_ok, hop = pcall(require, "hop")
if status_ok then
  hop.setup {
    case_insensitive = false,
  }
end
--- }}}
--- UFO {{{
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
local status_ok, ufo = pcall(require, "ufo")
if status_ok then
  ufo.setup {
    fold_virt_text_handler = require('mod').fold_handler,
    preview = {
      win_config = {
          border = {'', '─', '', '', '', '─', '', ''},
          winhighlight = 'Normal:Folded',
          winblend = 10
      },
      mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>'
      }
    },
  }
end
--- }}}
--- Registers {{{
local status_ok, registers = pcall(require, "registers")
if status_ok then
  vim.g.registers_delay = 100
  vim.g.registers_show_empty_registers = 0
  vim.g.registers_window_border = "rounded"
end
--- }}}
--- Stay-In-Place {{{
local status_ok, stay = pcall(require, "stay-in-place")
if status_ok then
  stay.setup {}
end
--- }}}
--- }}}
--- * Buffer * {{{
--- Harpoon {{{
local status_ok, harpoon = pcall(require, "harpoon")
if status_ok then
  local status_ok, telescope = pcall(require, "telescope")
  if status_ok then
    telescope.load_extension 'harpoon'
  end

  harpoon.setup {
    menu = {
      width = 50,
      height = 8,
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
    }
  }
end
--- }}}
--- JABS {{{
local status_ok, jabs = pcall(require, "jabs")
if status_ok then
  jabs.setup {
    border = 'rounded',
    offset = {
      bottom = 6,
    },
    preview = {
      border = 'rounded'
    },
    keymap = {
      close = "d",
      preview = "p",
    },
    highlight = {
      current = "Title",
      hidden = "FloatermNC",
      split = "EndOfBuffer",
      alternate = "Identifier"
    },
  }
end
--- }}}
--- Scope {{{
local status_ok, scope = pcall(require, "scope")
if status_ok then
  scope.setup()
end
--- }}}
--- Cybu {{{
local ok, cybu = pcall(require, "cybu")
if ok then
  cybu.setup {
    position = {
      relative_to = "win", -- win, editor, cursor
      anchor = "topright", -- topleft, topcenter, topright,
      -- centerleft, center, centerright,
      -- bottomleft, bottomcenter, bottomright
      -- vertical_offset = 10, -- vertical offset from anchor in lines
      -- horizontal_offset = 0, -- vertical offset from anchor in columns
      -- max_win_height = 5, -- height of cybu window in lines
      -- max_win_width = 0.5, -- integer for absolute in columns
      -- float for relative to win/editor width
    },
    display_time = 1750, -- time the cybu window is displayed
    behavior = {                    -- set behavior for different modes
      mode = {
        default = {
          switch = "immediate",     -- immediate, on_close
          view = "rolling",         -- paging, rolling
        },
        last_used = {
          switch = "on_close",      -- immediate, on_close
          view = "paging",          -- paging, rolling
        },
      },
    },
    style = {
      path = "relative", -- absolute, relative, tail (filename only)
      border = "rounded", -- single, double, rounded, none
      separator = " ", -- string used as separator
      prefix = "…", -- string used as prefix for truncated paths
      padding = 1, -- left & right padding in number of spaces
      hide_buffer_id = true,
      devicons = { enabled = true, colored = true, },
    },
    highlights = {                        -- see highlights via :highlight
      current_buffer = "cybufocus",       -- current / selected buffer
      adjacent_buffers = "cybuadjacent",  -- buffers not in focus
      background = "cybubackground",      -- window background
      border = "cybuborder",              -- border of the window
    },
    exclude = {
      "neo-tree",
      "fugitive",
      "qf",
    }
  }
end
--- }}}
--- }}}
--- * Finders * {{{
--- Browse {{{
local status_ok, browse = pcall(require, "browse")
if status_ok then
  browse.setup()

  function command(name, rhs, opts)
    opts = opts or {}
    vim.api.nvim_create_user_command(name, rhs, opts)
  end

  command("BrowseInput", function()
    browse.input_search()
  end, {})

  command("Browse", function()
    browse.browse({ bookmarks = bookmarks })
  end, {})

  command("BrowseBookmarks", function()
    browse.open_bookmarks({ bookmarks = bookmarks })
  end, {})

  command("BrowseDevdocs", function()
    browse.devdocs.search()
  end, {})

  command("BrowseDevdocsFiletype", function()
    browse.devdocs.search_with_filetype()
  end, {})

  command("BrowseMdn", function()
    browse.mdn.search()
  end, {})
end
--- }}}
--- Telescope {{{
---- Dont preview binary files
local status_ok, telescope = pcall(require, "telescope")
if status_ok then
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

  local actions = require('telescope.actions')

  telescope.setup{
    extensions = {
      ["ui-select"] = {
        -- require("telescope.themes").get_dropdown { }
      }
    },
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
      selection_caret = " ",
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
      winblend = 25,
      previewer = true,
      color_devicons = true,
      use_less = false,
      set_env = { ['COLORTERM'] = 'truecolor' },
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
  }

  require('telescope').load_extension('projects')
  require('telescope').load_extension('ui-select')
end
--- }}}
--- }}}
--- * Sessions * {{{
--- Session Manager {{{
local status_ok, session_manager = pcall(require, "session_manager")
if status_ok then
  session_manager.setup({
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = false, -- Automatically save last session on exit.
  autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
})
end

-- local tele_status_ok, telescope = pcall(require, "telescope")
-- local tele_session_status_ok, telescope = pcall(telescope.load_extension, "sessions")
--- }}}
--- Project {{{
local status_ok, project = pcall(require, "project_nvim")
if status_ok then
  project.setup({
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "Cargo.toml", ".hg", ".bzr", ".svn", "Makefile" },
  })
end
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
    { ns = '~/dev/shadotheme/colors/shado.vim' },
    { nX = '~/dev/shadotheme/colors/shado.vim' },
    { nx = '~/.local/share/nvim/site/pack/packer/opt/shadotheme/colors/shado.vim' },
    { x  = '~/.xmonad/xmonad.hs'               },
    { p  = '~/.config/shadobar/config-xmonad'  },
    { c  = '~/.config/picom.conf'              },
    { st = '~/dev/st/config.h'                 },
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
--- }}}
--- * Utility * {{{
--- Notify {{{
local status_ok, notify = pcall(require, "notify")
if status_ok then
  notify.setup {
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 500,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    background_colour = "#111119",

    -- Minimum width for notification windows
    minimum_width = 10,

    -- Icons for the different levels
    -- icons = {
    --   ERROR = icons.diagnostics.Error,
    --   WARN = icons.diagnostics.Warning,
    --   INFO = icons.diagnostics.Information,
    --   DEBUG = icons.ui.Bug,
    --   TRACE = icons.ui.Pencil,
    -- },
  }
end
--- }}}
--- Dressing {{{
local status_ok, dressing = pcall(require, "dressing")
if status_ok then
  dressing.setup({
    input = {
      -- Set to false to disable the vim.ui.input implementation
      enabled = true,
      default_prompt = "❱ ", -- Default prompt string
      prompt_align = "left", -- Can be 'left', 'right', or 'center'
      insert_only = true, -- When true, <Esc> will close the modal
      anchor = "SW", -- These are passed to nvim_open_win
      border = "single",
      relative = "cursor", -- 'editor' and 'win' will default to being centered

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      prefer_width = 40,
      width = nil,
      -- min_width and max_width can be a list of mixed types.
      -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

      winblend = 10, -- Window transparency (0-100)
      winhighlight = "", -- Change default highlight groups (see :help winhl)

      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,

      get_config = nil, -- see :help dressing_get_config
    },
    select = {
      -- Set to false to disable the vim.ui.select implementation
      enabled = true,
      -- Priority list of preferred vim.select implementations
      backend = { "telescope", "fzf", "builtin", "nui" },
      trim_prompt = true, -- Trim trailing `:` from prompt

      -- Options for telescope selector
      -- These are passed into the telescope picker directly. Can be used like:
      -- telescope = require('telescope.themes').get_ivy({...})
      -- telescope = nil,
      telescope = require("telescope.themes").get_cursor(),

      fzf = { window = { width = 0.5, height = 0.4, }, },
      fzf_lua = { winopts = { width = 0.5, height = 0.4, }, },

      -- Options for nui Menu
      nui = {
        position = "50%",
        size = nil,
        relative = "editor",
        border = { style = "single", },
        buf_options = { swapfile = false, filetype = "DressingSelect", },
        win_options = { winblend = 10, },
        max_width = 80,
        max_height = 40,
        min_width = 40,
        min_height = 10,
      },

      -- Options for built-in selector
      builtin = {
        anchor = "NW", -- These are passed to nvim_open_win
        border = "rounded",
        relative = "editor", -- 'editor' and 'win' will default to being centered

        winblend = 60, -- Window transparency (0-100)
        winhighlight = "", -- Change default highlight groups (see :help winhl)

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- the min_ and max_ options can be a list of mixed types.
        -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },

        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      -- Used to override format_item. See :help dressing-format
      format_item_override = {},
      get_config = nil,
    },
  })
end
--- }}}
--- Zen Mode {{{
local status_ok, zen = pcall(require, "zen-mode")
if status_ok then
  zen.setup({
    window = {
	  backdrop = 0.9,
	  height = 1, -- height of the Zen window
	  width = 1,
	  options = {
	    signcolumn = "yes", -- disable signcolumn
	    number = true, -- disable number column
	    relativenumber = true, -- disable relative numbers
     },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = false },
      twilight = { enabled = true },
    },
  })
end
--- }}}
--- Numb {{{
local status_ok, numb = pcall(require, "numb")
if status_ok then
  numb.setup{
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
    centered_peeking = true, -- Peeked line will be centered relative to window
  }
end
--- }}}
--- Venn {{{
local status_ok, venn = pcall(require, "venn")
if status_ok then
  function _G.Toggle_venn()
      local venn_enabled = vim.inspect(vim.b.venn_enabled)
      if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd[[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "b", ":VFill<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "v", "o", ":VBoxO<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "v", "H", ":VBoxH<CR>", {noremap = true})
      else
          vim.cmd[[setlocal ve=]]
          vim.cmd[[mapclear <buffer>]]
          vim.b.venn_enabled = nil
      end
  end
end
--- }}}
--- Colortils {{{
local status_ok, colortils = pcall(require, "colortils")
if status_ok then
  colortils.setup()
end
--- }}}
--- Colorizer {{{
local status_ok, colorizer = pcall(require, "colorizer")
if status_ok then
  colorizer.setup({ "*" }, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = false, -- "Name" codes like Blue oe blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background, virtualtext
    mode = "background", -- Set the display mode.)
  })
end
--- }}}
--- }}}
--- * Terminal * {{{
--- Floaterm {{{
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.5
vim.g.floaterm_height = 0.4
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1
vim.g.floaterm_title = 0
--- }}}
--- }}}
--- * Note Taking * {{{
--- Neorg {{{
local status_ok, neorg = pcall(require, "neorg")
if status_ok then
  neorg.setup {
    load = {
	    ["core.defaults"] = {}, -- Load all the defaults
	    ["core.norg.concealer"] = {}, -- Allows the use of icons
	    ["core.keybinds"] = { config = { default_keybinds = true, neorg_leader = "<leader>o" } },
	    ["core.gtd.base"] = { config = { workspace = "gtd" } },
	    ["core.integrations.treesitter"] = { config = { } },
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
      ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
      -- ["core.integrations.telescope"] = {},
      ["core.norg.completion"] = { config = { engine = "nvim-cmp", } },
    },
    -- logger = { level = "warn" },
  }
end
--- }}}
--- }}}
--- * Git * {{{
--- Git Signs {{{
local status_ok, gitsigns = pcall(require, "gitsigns")
if status_ok then
  gitsigns.setup {
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
    yadm = { enable = false },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  }
end
--- }}}
--- Lazygit {{{
vim.g.lazygit_floating_window_winblend = 20 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
--- }}}
--- Octo {{{
local status_ok, octo = pcall(require, "octo")
if status_ok then
  octo.setup()
end
--- }}}
--- }}}
--- * File Tree * {{{
--- Lir {{{
local status_ok, lir = pcall(require, "lir")
if status_ok then
  local actions = require "lir.actions"
  local mark_actions = require "lir.mark.actions"
  local clipboard_actions = require "lir.clipboard.actions"

  lir.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
      ["l"] = actions.edit,
      ["<C-s>"] = actions.split,
      ["v"] = actions.vsplit,
      ["<C-t>"] = actions.tabedit,

      ["h"] = actions.up,
      ["q"] = actions.quit,

      ["A"] = actions.mkdir,
      ["a"] = actions.newfile,
      ["r"] = actions.rename,
      ["@"] = actions.cd,
      ["Y"] = actions.yank_path,
      ["i"] = actions.toggle_show_hidden,
      ["d"] = actions.delete,

      ["J"] = function()
        mark_actions.toggle_mark()
        vim.cmd "normal! j"
      end,
      ["c"] = clipboard_actions.copy,
      ["x"] = clipboard_actions.cut,
      ["p"] = clipboard_actions.paste,
    },
    float = {
      winblend = 0,
      curdir_window = {
        enable = false,
        highlight_dirname = true,
      },
      -- You can define a function that returns a table to be passed as the third
      -- argument of nvim_open_win().
      win_opts = function()
        local width = math.floor(vim.o.columns * 0.2)
        local height = math.floor(vim.o.lines * 0.2)
        return {
          border = "rounded",
          width = width,
          height = height,
          -- row = 1,
          -- col = math.floor((vim.o.columns - width) / 2),
        }
      end,
    },
    hide_cursor = false,
    on_init = function()
      -- use visual mode
      vim.api.nvim_buf_set_keymap( 0, "x", "J", ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
        { noremap = true, silent = true }
      )

      -- echo cwd
      -- vim.api.nvim_echo({ { vim.fn.expand "%:p", "Normal" } }, false, {})
    end,
  }

  -- custom folder icon
  require("nvim-web-devicons").set_icon {
    lir_folder_icon = {
      icon = "",
      -- color = "#7ebae4",
      color = "#569CD6",
      name = "LirFolderNode",
    },
  }
end
--- }}}
--- Nvim Tree {{{
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if status_ok then
  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if config_status_ok then
      local tree_cb = nvim_tree_config.nvim_tree_callback

      vim.api.nvim_create_autocmd('BufEnter', {
          command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
          nested = true,
      })
      nvim_tree.setup {
        hijack_directories = {
          enable = false,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          }
        },
        -- update_to_buf_dir = {
        --   enable = false,
        -- },
        -- disable_netrw = true,
        -- hijack_netrw = true,
        -- open_on_setup = false,
        open_on_setup = false,
        ignore_ft_on_setup = {
          "startify",
          "dashboard",
          "alpha",
        },
        filters = {
          custom = { ".git" },
          exclude = { ".gitignore" },
        },
        -- open_on_tab = false,
        -- hijack_cursor = false,
        update_cwd = true,
        -- update_to_buf_dir = {
        --   enable = true,
        --   auto_open = true,
        -- },
        -- --   error
        -- --   info
        -- --   question
        -- --   warning
        -- --   lightbulb
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          highlight_opened_files = "none",
          root_folder_modifier = ":t",
          indent_markers = {
            enable = false,
            icons = {
              corner = "└ ",
              edge = "│ ",
              none = "  ",
            },
          },
          icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = ui_icons.ArrowOpen,
                arrow_closed = ui_icons.ArrowClosed,
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          icons = {
            hint = diagnostics_icons.Hint,
            info = diagnostics_icons.Information,
            warning = diagnostics_icons.Warning,
            error = diagnostics_icons.Error,
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
          ignore_list = {},
        },
        -- system_open = {
        --   cmd = nil,
        --   args = {},
        -- },
        -- filters = {
        --   dotfiles = false,
        --   custom = {},
        -- },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        view = {
          width = 30,
          -- height = 30,
          hide_root_folder = false,
          side = "left",
          -- auto_resize = true,
          mappings = {
            custom_only = false,
            list = {
              { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
              { key = "h", cb = tree_cb "close_node" },
              { key = "v", cb = tree_cb "vsplit" },
              { key = "s", cb = tree_cb "split" },
              { key = "<C-x>", action = "system_open" },
            },
          },
          number = false,
          relativenumber = false,
        },
      }
  end
end
--- }}}
--- }}}
--- * Status Line * {{{
--- Winbar {{{
winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "DressingSelect",
  "Jaq",
  "harpoon",
  "",
}

function isempty(s)
  return s == nil or s == ""
end

winbar_hl_group = "Keyword"
icon_hl_group = "WinbarFileIcon"
sep_hl_group = "WinbarSeparator"
tab_hl_group = "WinbarTabnbr"

get_filename = function()
  local filename = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"

  if not isempty(filename) then
    local file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )

    -- icon_hl_group = icon_hl_group .. extension
    -- vim.api.nvim_set_hl(0, icon_hl_group, { link = "WinbarFileIcon" })
    if isempty(file_icon) then
      file_icon = ""
      file_icon_color = ""
    end

    return " " .. "%#" .. icon_hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#"..winbar_hl_group .."#" .. filename .. "%*"
  end
end

local get_navic = function()
  local status_navic_ok, navic = pcall(require, "nvim-navic")
  if not status_navic_ok then return "" end

  local status_ok, navic_location = pcall(navic.get_location, {})
  if not status_ok then return "" end

  if not navic.is_available() or navic_location == "error" then
    return ""
  end

  if not isempty(navic_location) then
    return "%#"..sep_hl_group.."#" .. ui_icons.ChevronRight .. " " .. navic_location
  else return ""
  end
end

local excludes = function()
  if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

get_winbar = function()
  if excludes() then return end
  local value = get_filename()

  local navic_added = false
  if not isempty(value) then
    local navic_value = get_navic()
    value = value .. " " .. navic_value
    if not isempty(navic_value) then
      navic_added = true
    end
  end

  if not isempty(value) and get_buf_option "mod" then
    local mod = "%#NvimTreeWindowPicker#" .. ui_icons.Circle .. "%*"
    if navic_added then
      value = value .. " " .. mod
    else value = value .. mod
    end
  end

  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 and not isempty(value) then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    value = value .. "%=" .. "%#"..tab_hl_group.."#" .. tabpage_number .. "%#"..sep_hl_group.."#" .. "/" .. "%#"..tab_hl_group.."#" .. tostring(num_tabs)
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then return end
end

function get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else return buf_option
  end
end

if vim.fn.has "nvim-0.8" == 1 then
  vim.api.nvim_create_autocmd(
    { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    { callback = function() get_winbar() end, }
  )
end
--- }}}
--- Navic {{{
local status_ok, navic = pcall(require, "nvim-navic")
if status_ok then
  navic.setup {
    highlight = true,
    separator = " " .. ui_icons.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end
--- }}}
--- Lualine {{{
local status_ok, lualine = pcall(require, "lualine")
if status_ok then
  lualine.setup {
    options = {
      theme = 'shado',
      icons_enabled = true,
      disabled_filetypes = {},
      section_separators   = { '', '' },
      component_separators = { '', '' },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = { {
        'diagnostics', sources = { 'nvim_lsp' },
        sections = { 'error', 'warn' }, -- 'info', 'hint'
        diagnostics_color = {
          error = 'LualineDiagnosticError',
          warn  = 'LualineDiagnosticWarn', 
          info  = 'LualineDiagnosticInfo',
          hint  = 'LualineDiagnosticHint', 
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }, 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {
      -- {
      --   'diff',
      --   colored = true, -- Displays a colored diff status if set to true
      --   diff_color = {
      --     -- Same color values as the general color option can be used here.
      --     added    = 'DiffAdd',    -- Changes the diff's added color
      --     modified = 'DiffChange', -- Changes the diff's modified color
      --     removed  = 'DiffDelete', -- Changes the diff's removed color you
      --   },
      --   symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
      --   source = nil,
      -- },
      {
        'diagnostics', sources = { 'nvim_lsp' },
        sections = { 'error', 'warn' }, -- 'info', 'hint'
        diagnostics_color = {
          error = 'LualineDiagnosticError',
          warn  = 'LualineDiagnosticWarn', 
          info  = 'LualineDiagnosticInfo',
          hint  = 'LualineDiagnosticHint', 
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }, 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
    tabline = {},
    extensions = {'quickfix'},
  }
end
--- }}}
--- Tabline {{{
local status_ok, tabline = pcall(require, "tabline")
if status_ok then
  tabline.setup {
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
end
vim.cmd [[
  set guioptions-=e
  set sessionoptions+=tabpages,globals
]]
--- }}}
--- }}}
--- * Effects * {{{
--- Specs {{{
local status_ok, specs = pcall(require, "specs")
if status_ok then
  specs.setup{ 
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
end
--- }}}
--- Transparent {{{
local status_ok, transparent = pcall(require, "transparent")
if status_ok then
  transparent.setup({
      enable = true,
      extra_groups = {},
      exclude = {},
  })
end
--- }}}
--- Illuminate {{{
vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree', 'Startify'}
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
--- }}}
--- IndentBlankLine {{{
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if status_ok then
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
  indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = false,
    char_highlight_list = {
      "IndentBlanklineIndent1", "IndentBlanklineIndent2",
      "IndentBlanklineIndent3", "IndentBlanklineIndent4",
      "IndentBlanklineIndent5", "IndentBlanklineIndent6",
    },
  }
end
--- }}}
--- Tint {{{
local status_ok, tint = pcall(require, "tint")
if status_ok then
  -- tint.setup {
  --   bg = true,  -- Dim background highlights
  --   amt = -40,  -- Dim by value, brighten would just be 40
  --   ignore = { "SignColumn", "LineNr", "CursorLineNr", "WinSeparator", "Status.*" },  -- Highlight group patterns to ignore
  --   ignorefunc = function(winid)
  --     local buf = vim.api.nvim_win_get_buf(winid)
  --     local buftype vim.api.nvim_buf_get_option(buf, "buftype")
  --
  --     if buftype == "terminal" then
  --       -- Ignore `terminal`-type buffers
  --       return true
  --     end
  --
  --     -- Dim everything else
  --     return true
  --   end
  -- }
end
--- }}}
--- Headlines {{{
local status_ok, headlines = pcall(require, "headlines")
if status_ok then
  headlines.setup()
end
--- }}}
--- Highlight Colors {{{
local status_ok, hl_colors = pcall(require, "nvim-highlight-colors")
if status_ok then
  hl_colors.setup {}
end
--- }}}
--- Image {{{
local status_ok, image = pcall(require, "image")
if status_ok then
  image.setup {
    render = {
      min_padding = 5,
      show_label = true,
      use_dither = true,
    },
    events = {
      update_on_nvim_resize = true,
    },
  }
end
--- }}}
--- }}}
--- * Debugging * {{{
--- DAP {{{
local status_ok, dap = pcall(require, "dap")
if status_ok then
  dap.defaults.fallback.force_external_terminal = true
  dap.defaults.fallback.external_terminal = {
    command = '/usr/local/bin/st';
    args = {''};
  }
end
--- }}}
--- DAP UI {{{
vim.fn.sign_define('DapBreakpoint', {text="", texthl='DiagnosticSignError', linehl='', numhl=''})
local status_ok, dapui = pcall(require, "dapui")
if status_ok then
  dapui.setup({
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
end
-- }}}
--- Termdebug {{{
cmd('packadd! termdebug')
vim.g.termdebug_wide = 1
--- }}}
--- }}}
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
