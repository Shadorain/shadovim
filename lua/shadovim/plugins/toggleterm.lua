return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{
			mode = { "n", "t" },
			[[<C-`>]],
			"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
			{ desc = "Toggle Terminal" },
		},
	},
	-- version = "nightly",
	opts = {
		autochdir = true,
		shading_factor = 0.2,
		highlights = { NormalFloat = { link = "NormalFloat" }, FloatBorder = { link = "FloatBorder" } },
		float_opts = {
			border = "single",
			width = function()
				return math.ceil(vim.o.columns * 0.6)
			end,
			height = function()
				return math.ceil(vim.o.lines * 0.5)
			end,
			winblend = 25,
		},
		-- winbar = {
		-- 	enabled = false,
		-- 	name_formatter = function(_)
		-- 		return "ToggleTerm #" .. vim.b.toggle_number
		-- 	end,
		-- },
	},
}
