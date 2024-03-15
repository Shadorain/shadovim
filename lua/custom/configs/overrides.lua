local M = {}

-- add overrides in here(eg: mason.nvim)
M.mason = {
	ensure_installed = {
		"rust-analyzer",
		"taplo",
		"clang-format",
		"clangd",
		"codelldb",
		"lua-language-server",
		"stylua",
		"marksman"
	}
}

return M
