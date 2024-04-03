return {
	"p00f/clangd_extensions.nvim",
	ft = { "c", "cpp" },
	config = function()
		local on_attach = require("shadovim.plugins.lsp.attach").on_attach
		local capabilities = require("shadovim.plugins.lsp.attach").capabilities

		require("clangd_extensions").setup({
			server = {
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--background-index",
					"--fallback-style=Google",
					"--all-scopes-completion",
					"--clang-tidy",
					"--log=error",
					"--suggest-missing-includes",
					"--cross-file-rename",
					"--completion-style=detailed",
					"--pch-storage=memory", -- could also be disk
					"--folding-ranges",
					"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
					"--offset-encoding=utf-16", --temporary fix for null-ls
				},
				capabilities = capabilities,
			},
			extensions = {
				ast = {
					role_icons = {
						type = "",
						declaration = "",
						expression = "",
						specifier = "",
						statement = "",
						["template argument"] = "",
					},

					kind_icons = {
						Compound = "",
						Recovery = "",
						TranslationUnit = "",
						PackExpansion = "",
						TemplateTypeParm = "",
						TemplateTemplateParm = "",
						TemplateParamObject = "",
					},
				},
			},
		})
		vim.cmd([[
command! ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
command! -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
command! ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
command! ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
command! -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
]])
	end,
}
