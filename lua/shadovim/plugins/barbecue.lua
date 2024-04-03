return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	lazy = false,
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	opts = {
		excluded_filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"alpha",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"Jaq",
			"harpoon",
			"",
		},
		show_dirname = false,
		show_modified = true,

		theme = {
			normal = { bg = "None" },

			basename = { fg = "#ff7ab2", bold = true },
			context = { fg = "#5d5daf" },

			ellipsis = { fg = "#6272a4" },
			separator = { fg = "#6272a4" },
			modified = { fg = "#de286e" }, -- #bd93f9
		},
	},
}
