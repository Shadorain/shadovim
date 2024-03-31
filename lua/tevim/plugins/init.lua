local plugins = {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufRead",
		opts = function()
			require("nvim-web-devicons").set_default_icon("󰈚")
			return require("tevim.plugins.configs.devicons")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = { { "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
		branch = "v3.x",
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"3rd/image.nvim",
			{
				"s1n7ax/nvim-window-picker",
				event = "VeryLazy",
				version = "2.*",
				opts = {
					hint = "floating-big-letter",
					selection_chars = "ABCFJDKSL;CMRUEIWOQP",
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = { -- filter using buffer options
							filetype = { "neo-tree", "neo-tree-popup", "notify", "JABSwindow" },
							buftype = { "terminal", "quickfix" },
						},
					},
				},
			},
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = function()
			return require("tevim.plugins.configs.neotree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
		run = ":TSUpdate",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			{
				"windwp/nvim-ts-autotag",
				ft = { "html", "javascript", "jsx", "typescript", "tsx", "svelte", "vue", "xml", "markdown" },
				opts = { enable_close_on_slash = false },
				config = function(_, opts)
					require("nvim-ts-autotag").setup(opts)
				end,
			},
			{
				"RRethy/nvim-treesitter-textsubjects",
			},
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
			{
				"nvim-treesitter/playground",
				cmd = "TSPlaygroundToggle",
			},
		},
		opts = function()
			return require("tevim.plugins.configs.treesitter")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- version = "2.20.7",
		version = "2.20.7",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"echasnovski/mini.indentscope",
				opts = { symbol = "│" },
			},
		},
		opts = function()
			return require("tevim.plugins.configs.blankline")
		end,
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", " ", "'", "`", '"', "m", "g" },
		cmd = "WhichKey",
		opts = function()
			return require("tevim.plugins.configs.whichkey")
		end,
		config = function(_, opts)
			require("which-key").setup(opts.setup)
			require("custom.keymaps").whichkeys()
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ mode = "n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment" },
			{ mode = "i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment(Insert)" },
			{ mode = "v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment(Visual)" },
			{ mode = "n", "gcc", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment" },
			{ mode = "v", "gcc", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment(Visual)" },
		},
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({ pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() })
		end,
	},
	{
		"stevearc/dressing.nvim",
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		cmd = "TodoTelescope",
		opts = { signs = false },
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"debugloop/telescope-undo.nvim",
		},
		opts = function()
			return require("tevim.plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		opts = {
			enable_macro_history = true,
		},
		config = function(_, opts)
			require("neoclip").setup(opts)
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
						on_exit = function(_, return_code)
							if return_code == 0 then
								vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
								vim.schedule(function()
									require("lazy").load({ plugins = { "gitsigns.nvim" } })
								end)
							end
						end,
					})
				end,
				desc = "Load gitsigns only if git repository",
			})
		end,
		opts = function()
			return require("tevim.plugins.configs.gitsigns")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		opts = function()
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
			return require("colorizer").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{
				mode = { "n", "t" },
				[[<C-`>]],
				"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
				{ desc = "Toggle Terminal" },
			},
		},
		-- version = "nightly",
		opts = {
			autochdir = true,
			shading_factor = 0.2,
			highlights = { NormalFloat = { link = "NormalFloat" }, FloatBorder = { link = "FloatBorder" } },
			float_opts = {
				border = "single",
				width = function()
					return math.ceil(vim.o.columns * 0.6)
				end,
				height = function()
					return math.ceil(vim.o.lines * 0.5)
				end,
				winblend = 25,
			},
			-- winbar = {
			-- 	enabled = false,
			-- 	name_formatter = function(_)
			-- 		return "ToggleTerm #" .. vim.b.toggle_number
			-- 	end,
			-- },
		},
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"luukvbaal/statuscol.nvim",
				dependencies = "kevinhwang91/promise-async",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						ft_ignore = { "neo-tree", "Outline", "toggleterm" },
						segments = {
							{ sign = { namespace = { "diagnostic*" } } },
							{ sign = { namespace = { "gitsigns" } }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, "  " }, click = "v:lua.ScLa" },
							{ text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
						},
					})
				end,
			},
		},
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

	--------------------------------------------------------------
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- "hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"delphinus/cmp-ctags",
			"onsails/lspkind.nvim",
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("tevim.plugins.configs.luasnips").luasnip(opts)
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = function()
					require("nvim-autopairs").setup({ fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } })
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
		opts = function()
			return require("tevim.plugins.configs.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
		dependencies = {
			"folke/which-key.nvim",
			"utilyre/barbecue.nvim",
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUpdate" },
				opts = function()
					return require("tevim.plugins.configs.mason")
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				opts = { hint_enable = false },
			},
		},
		config = function()
			require("tevim.plugins.configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("tevim.plugins.configs.conform")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		lazy = false,
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		config = function()
			require("tevim.plugins.configs.barbecue")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
		},
		config = function()
			require("tevim.plugins.configs.noice")
		end,
	},
	{
		"mbbill/undotree",
	},
}

local check, _ = pcall(require, "custom")
if check then
	require("custom")
	local custom_plugins = require("custom.plugins")
	if #custom_plugins > 0 then
		for _, plugin in ipairs(custom_plugins) do
			-- local plugin_name = string.sub(plugin[1], -(string.len(plugin[1]) - string.find(plugin[1], "/")))
			-- print(
			-- 	(
			-- 		plugin_name
			-- 			:gsub("nvim%-", "", 1)
			-- 			:gsub("%.nvim", "", 1)
			-- 			:gsub("%.vim", "", 1)
			-- 			:gsub("%.lua", "", 1)
			-- 			:gsub("neovim%-", "", 1)
			-- 	)
			-- )
			table.insert(plugins, plugin)
		end
	end
else
	vim.cmd("TeVimCreateCustom")
end

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
