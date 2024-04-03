return {
	"folke/zen-mode.nvim",
	cmd = { "ZenMode" },
	config = function()
		require("zen").setup({
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
	end,
}
