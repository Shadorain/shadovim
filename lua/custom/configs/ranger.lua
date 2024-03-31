require("ranger-nvim").setup({
	-- replace_netrw = true,
})

vim.api.nvim_set_keymap("n", "<leader>fR", "", {
	noremap = true,
	callback = function()
		require("ranger-nvim").open(true)
	end,
})
