return {
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
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"tedash",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
}
