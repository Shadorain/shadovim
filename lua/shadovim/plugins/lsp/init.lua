return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
		dependencies = {
			"folke/which-key.nvim",
			"utilyre/barbecue.nvim",
			"williamboman/mason.nvim",
			"ray-x/lsp_signature.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = require("shadovim.plugins.lsp.attach").on_attach
			local capabilities = require("shadovim.plugins.lsp.attach").capabilities

			vim.diagnostic.config({
				virtual_text = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				signs = { text = { [1] = " ", [2] = " ", [3] = "", [4] = "🞧 " } },
				float = {
					suffix = "",
					header = { "  Diagnostics", "String" },
					prefix = function(_, _, _)
						return "  ", "String"
					end,
				},
			})

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			require("plugins.lsp").setup(on_attach, capabilities)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = function()
			return vim.tbl_deep_extend(require("tevim.plugins.configs.mason"), require("custom.configs.overrides").mason)
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = { hint_enable = false },
	},
}
