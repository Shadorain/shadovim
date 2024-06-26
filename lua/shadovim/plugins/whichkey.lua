return {
	"folke/which-key.nvim",
	keys = { "<leader>", " ", "'", "`", '"', "m", "g" },
	cmd = "WhichKey",
	opts = {
		setup = {
			key_labels = {
				["<space>"] = "SPC",
				["<leader>"] = "SPC",
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
			window = {
				border = "none",
				winblend = 15,
			},
			ignore_missing = true,
			show_help = true,
		},
	},
	config = function(_, opts)
		require("which-key").setup(opts.setup)
		require("config.keymaps").whichkeys()
	end,
}
