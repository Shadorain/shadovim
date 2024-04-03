return {
	"AckslD/nvim-neoclip.lua",
	event = "VeryLazy",
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = { enable_macro_history = true },
	config = function(_, opts)
		require("neoclip").setup(opts)
		require("telescope").load_extension("neoclip")
	end,
}
