return {
	setup = {
		key_labels = {
			["<space>"] = "SPACE",
			["<leader>"] = "SPACE",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "",
			separator = "",
			group = " ",
		},
		layout = {
			height = { min = 3, max = 20 },
			width = { min = 20, max = 50 },
			spacing = 15,
			align = "center",
		},
		ignore_missing = true,
		show_help = true,
		triggers = { "<leader>", "'", "g", "m", '"' },
	},
}
