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
			local lspconfig = vim.lsp.config()
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

			require("plugins.lsp.setup").setup(on_attach, capabilities)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			ui = {
				ensure_installed = require("plugins.lsp.overrides").mason.ensure_installed,
				icons = {
					package_pending = "󰁇 ",
					package_installed = " ",
					package_uninstalled = " ",
				},
				keymaps = {
					toggle_server_expand = "<CR>",
					install_server = "i",
					update_server = "u",
					update_all_servers = "U",
					check_server_version = "c",
					check_outdated_servers = "C",
					uninstall_server = "X",
					cancel_installation = "<C-c>",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = { hint_enable = false },
	},
}
