return {
	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*" },
			command = "lua require('lazygit.utils').project_root_dir()",
		})
		vim.g.lazygit_floating_window_winblend = 20 -- transparency of floating window
		vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
		vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╰", "╯" } -- customize lazygit popup window corner characters
		vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
		vim.g.lazygit_use_neovim_remote = 0 -- fallback to 0 if neovim-remote is not installed
		require("telescope").load_extension("lazygit")
	end,
}
