return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"luukvbaal/statuscol.nvim",
			dependencies = "kevinhwang91/promise-async",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					ft_ignore = { "neo-tree", "Outline", "toggleterm" },
					segments = {
						{ sign = { namespace = { "diagnostic*" } } },
						{ sign = { namespace = { "gitsigns" } }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, "  " }, click = "v:lua.ScLa" },
						{ text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
					},
				})
			end,
		},
	},
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
