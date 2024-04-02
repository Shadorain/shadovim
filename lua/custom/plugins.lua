local overrides = require("custom.configs.overrides")

return {
	-- Package Handling
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("tevim.plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- Completion
	{
		"Exafunction/codeium.nvim",
		event = "InsertEnter",
		config = true,
	},

	-- Language Support
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		config = function()
			require("custom.configs.rustaceanvim")
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = true,
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp" },
		config = function()
			require("custom.configs.clangd_extensions")
		end,
	},
	{
		"filipdutescu/renamer.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		opts = { border = true },
	},
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerToggle", "OverseerRun", "OverseerBuild" },
		opts = {
			dap = false, -- Manually set once dap is loaded
		},
	},

	-- Debugging
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
			},
		},
		config = function()
			require("custom.configs.dapui")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},
		},
	},

	-- Commenting/Bookmarks
	{
		"tomasky/bookmarks.nvim",
		after = "telescope.nvim",
		config = function()
			require("bookmarks").setup()
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"LudoPinelli/comment-box.nvim",
		cmd = { "CBccbox", "CBllline", "CBline", "CBllbox14", "CBd" },
		config = true,
	},
	{
		"lalitmee/browse.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("custom.configs.browse")
		end,
	},
	{
		"danymat/neogen",
		cmd = { "Neogen" },
		config = true,
	},

	-- Movement
	{
		"nacro90/numb.nvim",
		event = "BufWinEnter",
		config = true,
	},
	{
		"matbme/JABS.nvim",
		cmd = { "JABSOpen" },
		config = function()
			require("custom.configs.jabs")
		end,
	},
	{
		"nat-418/bufala.nvim",
		event = "BufWinEnter",
		opts = { layout = "stack" },
	},
	{
		"nat-418/tabbot.nvim",
		event = "BufWinEnter",
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		event = "BufWinEnter",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.configs.harpoon")
		end,
	},
	{
		"gbprod/stay-in-place.nvim",
		event = "BufWinEnter",
		config = true,
	},
	{
		"phaazon/hop.nvim",
		keys = { "f", "F", "t", "T", "s", "S" },
		branch = "v2",
		opts = { keys = "etovxqpdygfblzhckisuran", case_insensitive = false },
	},
	{
		"ghillb/cybu.nvim",
		cmd = { "CybuNext", "CybuPrev", "CybuLastusedNext", "CybuLastusedPrev" },
		opts = {
			position = {
				anchor = "topright",
			},
			behavior = {
				mode = { last_used = { switch = "immediate" }, auto = { view = "paging" } },
			},
			display_time = 1750,
		},
	},
	{
		"declancm/cinnamon.nvim",
		event = "BufWinEnter",
		opts = { extra_keymaps = true, extended_keymaps = true, max_length = 100 },
	},

	-- Session Management
	{
		"stevearc/resession.nvim",
		lazy = false,
		config = function()
			require("custom.configs.resession")
		end,
		dependencies = {
			{
				"tiagovla/scope.nvim",
				lazy = false,
				config = true,
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		opts = {
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "Cargo.toml", ".hg", ".bzr", ".svn", "Makefile" },
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
			require("telescope").load_extension("projects")
		end,
	},

	-- Images
	{
		"edluffy/hologram.nvim",
		ft = { "norg", "md" },
		opts = { auto_display = true },
	},
	{
		"ekickx/clipboard-image.nvim",
		ft = { "norg", "md" },
		config = function()
			require("custom.configs.clipboard-image")
		end,
	},

	-- Git
	{
		"pwntester/octo.nvim",
		cmd = { "Octo" },
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("custom.configs.lazygit")
		end,
	},

	-- Productivity Tools
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		config = function()
			require("custom.configs.zen-mode")
		end,
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle", "AerialNavToggle", "AerialCloseAll", "A" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				vim.keymap.set("n", "[[", "<cmd>AerialPrevUp<CR>", { buffer = bufnr })
				vim.keymap.set("n", "]]", "<cmd>AerialNextUp<CR>", { buffer = bufnr })
			end,
		},
	},
	{
		"SmiteshP/nvim-navbuddy",
		cmd = { "Navbuddy" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = { lsp = { auto_attach = true } },
	},
	{
		"jbyuki/venn.nvim",
		cmd = { "ToggleVenn" },
		config = function()
			require("custom.configs.venn")
		end,
	},
	{
		"epwalsh/pomo.nvim",
		version = "*",
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat" },
		dependencies = {
			-- "rcarriga/nvim-notify",
			"j-hui/fidget.nvim",
		},
		opts = {
			notifiers = { { name = "Default", opts = { sticky = false } } },
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Documents/Sync/ObsidianVault/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Sync/ObsidianVault/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
			"epwalsh/pomo.nvim",
		},
		opts = {
			workspaces = { { name = "personal", path = "~/Documents/Sync/ObsidianVault/" } },
		},
	},
	{
		"letieu/jot.lua",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { "<leader>fj" },
		opts = {
			win_opts = {
				relative = "editor",
				width = 80,
				height = 25,
				row = 2,
				col = vim.o.columns - 85,
			},
		},
	},

	-- Theme
	{
		"Shadorain/shadotheme",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("shado")
			vim.cmd([[hi Keyword gui=italic]])
		end,
	},
	{
		"xiyaowong/nvim-transparent",
		event = "VimEnter",
		config = true,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("custom.configs.alpha")
		end,
	},

	-- Utilities
	{
		"LunarVim/peek.lua",
		keys = { { "gp", ":lua require('peek').Peek('definition')<CR>", mode = { "n", "x", "o" }, desc = "Peek" } },
	},
	{
		"echasnovski/mini.nvim",
		event = "BufWinEnter",
		config = function()
			require("custom.configs.mini")
		end,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
	},
	{
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
		config = function()
			require("mkdir")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("custom.configs.lualine")
		end,
	},
	{
		"kelly-lin/ranger.nvim",
		event = "BufWinEnter",
		config = function()
			require("custom.configs.ranger")
		end,
	},
	{
		"tummetott/unimpaired.nvim",
		config = true,
	},
}
