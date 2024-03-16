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
		"github/copilot.vim",
	},
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
		config = true,
	},
	{
		"Shatur/neovim-tasks",
		opts = {
			params_file = ".neovim.json", -- JSON file to store module and task parameters.
			quickfix = {
				pos = "botright", -- Default quickfix position.
				height = 15, -- Default height.
			},
		},
	},

	-- Debugging
	{
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("custom.configs.dapui")
		end,
	},
	{
		"ravenxrz/DAPInstall.nvim",
	},

	-- Commenting/Bookmarks
	{
		"tomasky/bookmarks.nvim",
		after = "telescope.nvim",
		event = "VimEnter",
		config = function()
			require("bookmarks").setup()
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"LudoPinelli/comment-box.nvim",
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
		config = true,
	},

	-- Movement
	{
		"nacro90/numb.nvim",
		config = true,
	},
	{
		"matbme/JABS.nvim",
		config = function()
			require("custom.configs.jabs")
		end,
	},
	{
		"nat-418/bufala.nvim",
		opts = {
			layout = "stack",
		},
	},
	{
		"nat-418/tabbot.nvim",
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.configs.harpoon")
		end,
	},
	{
		"gbprod/stay-in-place.nvim",
		config = true,
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = { case_insensitive = false },
	},

	-- Session Management
	{
		"tiagovla/scope.nvim",
		config = true,
	},

	-- Images
	{
		"edluffy/hologram.nvim",
		ft = { "norg", "md" },
		opts = { auto_display = true },
	},
	{
		"ekickx/clipboard-image.nvim",
		config = function()
			require("custom.configs.clipboard-image")
		end,
	},

	-- Git
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
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
		config = function()
			require("custom.configs.zen-mode")
		end,
	},
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		},
	},
	{
		"jbyuki/venn.nvim",
		config = function()
			require("custom.configs.venn")
		end,
	},

	-- Utilities
	{
		"LunarVim/peek.lua",
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("custom.configs.mini")
		end,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false, -- Ensure that it runs first to minimize delay when opening file from terminal
		priority = 1001,
	},
	{
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
		event = "BufWritePre",
	},
}
