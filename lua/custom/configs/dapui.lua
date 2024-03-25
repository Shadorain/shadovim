local dap = require("dap")
local dapui = require("dapui")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	layouts = {
		{
			-- You can change the order of elements in the sidebar
			elements = {
				-- Provide as ID strings or tables with "id" and "size" keys
				{ id = "scopes", size = 0.40 }, -- Can be float or integer > 1
				{ id = "stacks", size = 0.25 },
				-- { id = "console", size = 0.15, },
				{ id = "repl", size = 0.25 },
				{ id = "breakpoints", size = 0.10 },
				-- { id = "watches", size = 0.25 },
			},
			size = 0.20,
			position = "bottom", -- Can be "left", "right", "top", "bottom"
		},
		{
			elements = {},
			size = 0.20,
			position = "left", -- Can be "left", "right", "top", "bottom"
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single",
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
