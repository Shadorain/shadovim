return {
	{
		"Shadorain/shadotheme",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("shado")
			vim.cmd([[hi Keyword gui=italic]])
		end,
	},

	{ "xiyaowong/nvim-transparent", event = "VimEnter", config = true },
}
