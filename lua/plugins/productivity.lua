return {
	{
		"epwalsh/pomo.nvim",
		version = "*",
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat" },
		dependencies = "j-hui/fidget.nvim",
		opts = { notifiers = { { name = "Default", opts = { sticky = false } } } },
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
}
