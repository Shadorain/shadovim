return {
	"numToStr/Comment.nvim",
	keys = {
		{ mode = "n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment" },
		{ mode = "i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment(Insert)" },
		{ mode = "v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment(Visual)" },
		{ mode = "n", "gcc", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment" },
		{ mode = "v", "gcc", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment(Visual)" },
	},
	dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	config = function()
		require("Comment").setup({ pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() })
	end,
}
