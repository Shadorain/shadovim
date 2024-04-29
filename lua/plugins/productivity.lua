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
		opts = {
			win_opts = {
				style = "minimal",
				relative = "editor",
				border = "rounded",
				width = math.floor(vim.o.columns * 0.25), -- 80
				height = 15,
				row = 2,
				col = vim.o.columns - (math.floor(vim.o.columns * 0.25) + 5),
			},
		},
	},
}
