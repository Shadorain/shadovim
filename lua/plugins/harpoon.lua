return {
	"ThePrimeagen/harpoon",
	event = "BufWinEnter",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup({
			menu = {
				width = 50,
				height = 8,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		})
		require("telescope").load_extension("harpoon")
	end,
}
