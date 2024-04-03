return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	opts = {
		detection_methods = { "lsp", "pattern" },
		patterns = { ".git", "Cargo.toml", ".hg", ".bzr", ".svn", "Makefile" },
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
		require("telescope").load_extension("projects")
	end,
}
