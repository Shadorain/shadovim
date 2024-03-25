require("harpoon").setup({
	menu = {
		width = 50,
		height = 8,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	},
})
require("telescope").load_extension("harpoon")
