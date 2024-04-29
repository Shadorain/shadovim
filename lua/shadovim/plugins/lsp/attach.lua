local M = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lsp_references = function()
	local builtin = require("telescope.builtin")
	local opts = {
		layout_strategy = "vertical",
		layout_config = { prompt_position = "bottom" },
		sorting_strategy = "ascending",
		ignore_filename = false,
	}
	builtin.lsp_references(opts)
end

local lsp_implementations = function()
	local builtin = require("telescope.builtin")
	local opts = {
		layout_strategy = "vertical",
		layout_config = { prompt_position = "bottom" },
		sorting_strategy = "ascending",
		ignore_filename = false,
	}
	builtin.lsp_implementations(opts)
end

M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr, nowait = true }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	require("which-key").register({
		["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Diag Prev" },
		["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diag Next" },
		K = {
			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			"Hover",
		},
		g = {
			d = { "<cmd>Telescope lsp_definitions<CR>", "Definition" },
			D = { "<cmd>Telescope lsp_declarations<CR>", "Declaration" },
			I = { "<cmd>Telescope lsp_incoming_calls<CR>", "Incoming Calls" },
			O = { "<cmd>Telescope lsp_outgoing_calls<CR>", "Outgoing Calls" },
			r = {
				function()
					lsp_references()
				end,
				"References",
			},
			i = {
				function()
					lsp_implementations()
				end,
				"Implementations",
			},
			E = { '<cmd>lua vim.cmd.RustLsp("expandMacro")()<CR>', "Expand Macro" },
			P = { '<cmd>lua vim.cmd.RustLsp("parentModule")<CR>', "Parent Module" },
			C = { '<cmd>lua vim.cmd.RustLsp("openCargo")<CR>', "Open Cargo.toml" },
		},

		["<leader>"] = {
			c = {
				name = "CODE ACTIONS",
				a = {
					function()
						-- if vim.bo[bufnr].filetype == "rust" then
						-- 	vim.cmd.RustLsp("codeAction")
						-- else
						vim.lsp.buf.code_action()
						-- end
					end,
					"Code Actions",
				},
				l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Code Lens" },
				o = { '<cmd>lua vim.cmd.RustLsp("openDocs")<CR>', "Open Docs" },
				h = { '<cmd>lua vim.cmd.RustLsp({ "hover", "actions" })<CR>', "Hover Actions" },
				e = { '<cmd>lua vim.cmd.RustLsp("explainError")<CR>', "Explain Error" },
				R = { '<cmd>lua vim.cmd.RustLsp("renderDiagnostic")<CR>', "Render Diagnostic" },

				b = { "<cmd>OverseerBuild<CR>", "Build" },
				r = { "<cmd>OverseerRun<CR>", "Run" },
				t = { "<cmd>OverseerToggle<CR>", "Overseer Toggle" },
			},

			w = {
				a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace" },
				r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace" },
				l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspaces" },
			},
		},
	}, bufopts)

	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, bufopts)

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(bufnr, true)
	end

	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "rounded" },
	}, bufnr)
end

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())
M.capabilities.offsetEncoding = { "utf-16", "utf-8" }

return M
