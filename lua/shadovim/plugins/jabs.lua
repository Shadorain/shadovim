return {
	"matbme/JABS.nvim",
	cmd = { "JABSOpen" },
	opts = {
		border = "rounded",
		offset = {
			bottom = 6,
		},
		preview = {
			border = "rounded",
		},
		keymap = {
			close = "d",
			preview = "p",
		},
		highlight = {
			current = "Title",
			hidden = "FloatermNC",
			split = "EndOfBuffer",
			alternate = "Identifier",
		},
	},
}
