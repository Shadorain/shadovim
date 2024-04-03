return {
	"stevearc/aerial.nvim",
	cmd = { "AerialToggle", "AerialNavToggle", "AerialCloseAll", "A" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			vim.keymap.set("n", "[[", "<cmd>AerialPrevUp<CR>", { buffer = bufnr })
			vim.keymap.set("n", "]]", "<cmd>AerialNextUp<CR>", { buffer = bufnr })
		end,
	},
}
