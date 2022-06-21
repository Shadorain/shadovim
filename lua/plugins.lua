--[[ ========================================================================
"  __________.__               .__                   .__                
"  \______   \  |  __ __  ____ |__| ____   ______    |  |  __ _______   
"   |     ___/  | |  |  \/ ___\|  |/    \ /  ___/    |  | |  |  \__  \  
"   |    |   |  |_|  |  / /_/  >  |   |  \\___ \     |  |_|  |  // __ \_
"   |____|   |____/____/\___  /|__|___|  /____  > /\ |____/____/(____  /
"                      /_____/         \/     \/  \/                 \/
" =========================================================================== ]]
-- [[ Setup ]] -------------------------------------------------------------- ]]
--- Install {{{
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
--- }}}
--- Run {{{
vim.cmd[[packadd packer.nvim]]
require('packer').init({
	git = { clone_timeout = 350, },
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" }
	}
})
--- }}}
-- [[ Plugins ]] ------------------------------------------------------------ ]]
return require('packer').startup(function(use)
    -- [[ Packer ]]
    use { 'wbthomason/packer.nvim' }

    -- [[ Speed up ]]
    use { 'lewis6991/impatient.nvim', opt = true,
		config = function() require('impatient') end
	}

    -- [[ Utility ]]
    use { 'nvim-lua/plenary.nvim' }        --- general utilities
    use { 'MattesGroeger/vim-bookmarks' }  --- bookmarks
    use { 'tpope/vim-commentary' }         --- commenting
    use { 'voldikss/vim-floaterm' }        --- Terminal
    use { 'vim-scripts/genutils' }         --- general utilities
    use { 'godlygeek/tabular' }            --- tabbing
    use { 'rafamadriz/friendly-snippets' } --- snippets
    use { 'edluffy/specs.nvim' }           --- cursor beacon
    use { 'qpkorr/vim-bufkill' }           --- kill buffers properly
    -- use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    -- use { 'vijaymarupudi/nvim-fzf' }
    -- Todo Comments {{{
    use { "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
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
      end
    } -- }}}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    -- use { 'habamax/vim-godot' }
    -- Tabline {{{
    use { 'kdheepak/tabline.nvim',
        config = function()
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
        end,
        requires = { {'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true} }
    }
    -- }}}
    -- Autopairs {{{
    use { 'jiangmiao/auto-pairs',          --- autoclosing (till autopairs gets any better)
        config = function()
            vim.cmd [[
              let g:AutoPairsFlyMode = 0
              let g:AutoPairsShortcutBackInsert = '<M-C-v>'
              let g:AutoPairsShortcutFastWrap = '<M-S-n>'
              let g:AutoPairsMapCh = 0
              let g:AutoPairsMoveCharacter = "()[]{}\"'"
              au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', '\W\zs|': '|', '/*': '*/', "\W\zs\'": ''})
              au FileType c,cpp let b:AutoPairs = AutoPairsDefine({'<': '>', '/*': '*/', "\W\zs\'": ''})
            ]]
        end
    }
    -- }}}
    -- IndentLine {{{
    use {'lukas-reineke/indent-blankline.nvim', event="Colorscheme",
       config = function()
            vim.cmd[[hi IndentBlanklineIndent1 guifg=#1b1b29 guibg=NONE blend=10]]
            vim.cmd[[hi IndentBlanklineIndent2 guifg=#1b1b29 guibg=NONE blend=10]]
            vim.cmd[[hi IndentBlanklineIndent3 guifg=#1b1b29 guibg=NONE blend=10]]
            vim.cmd[[hi IndentBlanklineIndent4 guifg=#1b1b29 guibg=NONE blend=10]]
            vim.cmd[[hi IndentBlanklineIndent5 guifg=#1b1b29 guibg=NONE blend=10]]
            vim.cmd[[hi IndentBlanklineIndent6 guifg=#1b1b29 guibg=NONE blend=10]]
           vim.g.indentLine_enabled = 1
           vim.g.indent_blankline_char = "▏"
           vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer", "norg" }
           vim.g.indent_blankline_buftype_exclude =  { "terminal", "norg", "TelescopePrompt", "Startify" }
           require('indent_blankline').setup {
               char_highlight_list = {
                   "IndentBlanklineIndent1", "IndentBlanklineIndent2",
                    "IndentBlanklineIndent3", "IndentBlanklineIndent4",
                    "IndentBlanklineIndent5", "IndentBlanklineIndent6",
               },
           }
       end
    }
    -- }}}
    -- Neorg {{{
    use { 'nvim-neorg/neorg',
        config = function()
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
		end,
		after = "nvim-treesitter"
	}
	-- }}}

    -- [[ Git integration ]]
    use { 'nvim-lua/popup.nvim' }
    -- GitSigns {{{
    use { 'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        event = 'BufRead',
        config = function()
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
        end
    }
    -- }}}

    -- [[ Coding ]]
    --- [[ LSP & Completion ]] {{{
    use { 'neovim/nvim-lspconfig' } --- Native LSP
    use { 'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/nvim-cmp',       --- Autocompletion
        config = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
            end

            local luasnip = require('luasnip')
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup {
                preselect = cmp.PreselectMode.None,
                completion = { completeopt = "menu,menuone,noselect,noinsert" },
                snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
                mapping = {
                    ["<C-j>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                    ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                    ['<C-m>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() == 1 then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
                        elseif has_words_before() and luasnip.expand_or_jumpable() then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '', true)
                        else fallback() end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function()
                        if cmp.visible() == 1 then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', true)
                        elseif luasnip.jumpable(-1) then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '', true)
                        end
                    end, { 'i', 's' }),
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
                },
                formatting = {
                    format = lspkind.cmp_format({with_text=true, menu = ({
                        buffer = "[B]",
                        nvim_lsp = "[L]",
                        luasnip = "[S]",
                        calc = "[C]",
                        path = "[P]",
                        neorg = "[N]",
                        cmp_tabnine = "[T]",
                    }),
                    -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    }),
                },
                experimental = { ghost_text = false, custom_menu = true }
            }
        end,
        requires = {
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
        },
    }
    use { 'onsails/lspkind-nvim' }
	use { 'ray-x/lsp_signature.nvim', module = 'lsp_signature' }
	use { "simrat39/symbols-outline.nvim",
		setup = function()
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
		end,
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" }
	}
    --- }}}
    --- [[ Treesitter ]] {{{
    use { 'nvim-treesitter/nvim-treesitter', --- treesitter
        run = ':TSUpdate',
        config = function()
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
		end
    }
    use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
	use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' }
	use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
    --- }}}
    --- [[ Languages ]]
    use { 'sheerun/vim-polyglot' }     --- *
    use { 'rust-lang/rust.vim' }       --- rust!
    use { 'arzg/vim-rust-syntax-ext' } --- rust: syntax extension
    use { 'simrat39/rust-tools.nvim' } --- rust: loads of tools
    -- use { 'plasticboy/vim-markdown' }  --- markdown

    -- [[ Make it pretty ]]
    use { 'kyazdani42/nvim-web-devicons' }      --- icons
    use { 'norcalli/nvim-colorizer.lua' }       --- Colorizer
    use { 'junegunn/goyo.vim' }                 --- focus
    use { 'xiyaowong/nvim-transparent' }        --- transparency

    -- [[ Finders ]]
    use { 'nvim-telescope/telescope.nvim' } --- file/buffer/etc
    use { 'unblevable/quick-scope' }        --- horizonal movement

    -- [[ Miscellaneous ]]
    use { 'mhinz/vim-startify' } --- Start Screen
    use { 'jghauser/mkdir.nvim', --- Make directory
		config = function() require('mkdir') end,
		event = "BufWritePre"
	}
end)
-- [[ ----------------------------------------------------------------------- ]]
