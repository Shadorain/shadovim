return {
	{ "saecki/crates.nvim", event = { "BufRead Cargo.toml" }, config = true },
	{ "LudoPinelli/comment-box.nvim", cmd = { "CBccbox", "CBllline", "CBline", "CBllbox14", "CBd" }, config = true },
	{ "nat-418/bufala.nvim", event = "BufWinEnter", opts = { layout = "stack" } },
	{ "nat-418/tabbot.nvim", event = "BufWinEnter", config = true },
	-- { "declancm/cinnamon.nvim", event = "BufWinEnter", opts = { extra_keymaps = true, extended_keymaps = true, max_length = 100 } },
	{ "edluffy/hologram.nvim", ft = { "norg", "md" }, opts = { auto_display = true } },
	{ "pwntester/octo.nvim", cmd = { "Octo" }, requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" }, config = true },
	{ "SmiteshP/nvim-navbuddy", cmd = { "Navbuddy" }, dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" }, opts = { lsp = { auto_attach = true } } },
	{ "LunarVim/peek.lua", keys = { { "gp", ":lua require('peek').Peek('definition')<CR>", mode = { "n", "x", "o" }, desc = "Peek" } } },
	{ "willothy/flatten.nvim", lazy = false, priority = 1001, config = true },
	{ "tummetott/unimpaired.nvim", event = "BufReadPost", config = true },
}
