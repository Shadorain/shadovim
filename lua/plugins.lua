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

    -- [[ Coding ]]
	--- [[ LSP ]] {{{
    use { 'neovim/nvim-lspconfig' }
    use { 'kabouzeid/nvim-lspinstall', --- native LSP
        config = function()
			local lspconfig, lspinstall = require('lspconfig'), require('lspinstall')
			local configurations = require('lsp_config')
			local installed_servers = lspinstall.installed_servers()
			lspinstall.setup()

			local setup_servers = function()
				for _, server in ipairs(installed_servers) do
  					lspconfig[server].setup(vim.tbl_extend("force", configurations[server] or {}, {
  						on_attach = function(_, bufnr)
							local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  							local opts = { noremap = true, silent = true }

  							buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  							buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  							buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  							buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  							buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  							buf_set_keymap("n", "<Leader>da", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  							buf_set_keymap("n", "<Leader>dr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  							buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  							buf_set_keymap("n", "<Leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  							buf_set_keymap("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  							buf_set_keymap("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
							vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  							vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  							require('lsp_signature').on_attach({ hint_prefix = " ", })
  						end
  					}))
				end
			end
			setup_servers()

			-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
			lspinstall.post_install_hook = function()
  				setup_servers()
  				vim.cmd("bufdo e")
			end
		end,
		requires = "nvim-lspconfig",
		event = "ColorScheme"
    }
	use { "ray-x/lsp_signature.nvim",   --- signature hints
		module = "lsp_signature"
	}
	use { "nvim-lua/lsp_extensions.nvim" }

    local nvim_lsp = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    nvim_lsp.rust_analyzer.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          cargo = { loadOutDirsFromCheck = true },
          procMacro = { enable = true },
        },
      },
    }
    require("rust-tools").setup {}
	--- }}}
	--- [[ Completion ]] {{{
	use { "hrsh7th/nvim-cmp",
		config = function()
			local cmp = require('cmp')
			cmp.setup {
				completion = { completeopt = "menuone,noselect", },
    			snippet = {
      				expand = function(args)
						require('luasnip').lsp_expand(args.body)
      				end
    			},
    			mapping = {
      				["<C-p>"] = cmp.mapping.select_prev_item(),
      				["<C-n>"] = cmp.mapping.select_next_item(),
      				["<C-d>"] = cmp.mapping.scroll_docs(-4),
      				["<C-u>"] = cmp.mapping.scroll_docs(4),
      				["<C-Space>"] = cmp.mapping.complete(),
      				["<C-c>"] = cmp.mapping.close(),
      				["<CR>"] = cmp.mapping.confirm({
        				behavior = cmp.ConfirmBehavior.Replace,
        				select = false,
      				})
    			},
    			sources = {
      				{ name = "buffer" }, { name = "nvim_lua" },
					{ name = "nvim_lsp" }, { name = "luasnip" },
					{ name = "calc" }, { name = "path" },
    			},
  			}
		end,
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp", },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp", },
			{ "hrsh7th/cmp-calc", after = "nvim-cmp", },
			{ "hrsh7th/cmp-path", after = "nvim-cmp", },
		},
	}
    --- }}}
    --- [[ Treesitter ]] {{{
    use { 'nvim-treesitter/nvim-treesitter', --- treesitter
        run = ':TSUpdate',
        opt = true,
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
			parser_configs.markdown = {
				install_info = {
        			url = "https://github.com/ikatyang/tree-sitter-markdown",
        			files = {"src/parser.c", "src/scanner.cc"}
    			},
    			filetype = "markdown",
			}
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",
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
				autopairs = { enable = true },
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
      					toggle_hl_groups = 'i',
      					toggle_injected_languages = 't',
      					toggle_anonymous_nodes = 'a',
      					toggle_language_display = 'I',
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
    use { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" }
	use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
	use { "JoosepAlviste/nvim-ts-context-commentstring",
		requires = { { "Olical/aniseed", after = "nvim-treesitter" } },
		after = "nvim-treesitter",
	}
	use { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
    use { "windwp/nvim-autopairs",
		event = "ColorScheme",
		config = function()
			require('nvim-autopairs').setup { check_ts = true }
			require('nvim-autopairs.completion.cmp').setup({
  				map_cr = true,
  				map_complete = true,
			})
		end
	}
    --- }}}
    --- [[ Languages ]]
    use { 'sheerun/vim-polyglot' }     --- *
    use { 'rust-lang/rust.vim' }       --- rust!
    use { 'arzg/vim-rust-syntax-ext' } --- rust: syntax extension
    use { 'simrat39/rust-tools.nvim' } --- rust: loads of tools
    use { 'plasticboy/vim-markdown' }  --- markdown

    -- [[ Utility ]]
    use { 'MattesGroeger/vim-bookmarks' } --- bookmarks
    use { 'tpope/vim-commentary' }        --- commenting
    use { 'voldikss/vim-floaterm' }       --- Terminal
    use { 'vim-scripts/genutils' }        --- general utilities
    use { 'godlygeek/tabular' }           --- tabbing
    use { 'mfussenegger/nvim-dap' }       --- debugging
    -- use { 'honza/vim-snippets' }       --- snippets
    use { "L3MON4D3/LuaSnip", module = "cmp", } --- snippets

    -- [[ Make it pretty ]]
    use { 'kyazdani42/nvim-web-devicons' }      --- icons
    use { 'itchyny/lightline.vim', opt = true } --- Statusbar
    use { 'junegunn/goyo.vim' }                 --- focus
    use { "norcalli/nvim-colorizer.lua" }       --- Colorizer

    -- [[ Git integration ]]
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'airblade/vim-gitgutter' }

    -- [[ Finders ]]
    use { 'nvim-telescope/telescope.nvim' } --- file/buffer/etc
    use { 'unblevable/quick-scope' }        --- horizonal movement
    use { 'phaazon/hop.nvim' }              --- vertical movement
    use { 'justinmk/vim-sneak' }            --- both movement
    use { 'mileszs/ack.vim' }               --- searcher

    -- [[ Miscellaneous ]]
    use { 'mhinz/vim-startify', opt = true } --- Start Screen
    use { "jghauser/mkdir.nvim",             --- Make directory
		config = function() require('mkdir') end,
		event = "BufWritePre"
	}
    use { "jghauser/follow-md-links.nvim",   --- Follow Markdown Links
  		config = function() require('follow-md-links') end,
  		event = "ColorScheme"
	}
end)
-- [[ ----------------------------------------------------------------------- ]]
