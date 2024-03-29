local lualine = require("lualine")
local shadoline = require("custom.themes.lualine.shadoline")

local pomo = function()
	local ok, pomo = pcall(require, "pomo")
	if not ok then
		return ""
	end

	local timer = pomo.get_first_to_finish()
	if timer == nil then
		return ""
	end

	return "󰄉 " .. tostring(timer)
end

local lazy = require("lazy")
local sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch" },
	lualine_c = { "filename" },
	lualine_x = {
		"overseer",
		{
			"diagnostics",
			icons_enabled = true,
			sources = { "nvim_lsp" },
			sections = { "error", "warn" }, -- 'info', 'hint'
			diagnostics_color = {
				error = "LualineDiagnosticError",
				warn = "LualineDiagnosticWarn",
				info = "LualineDiagnosticInfo",
				hint = "LualineDiagnosticHint",
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		},
		pomo,
	},
	lualine_y = {
		{
			"filetype",
			icons_enabled = false,
		},
	},
	lualine_z = { "location" },
}

-- Extensions
local lazy_ext = {
	sections = {
		lualine_a = {
			function()
				return "LAZY"
			end,
		},
		lualine_y = {
			function()
				return "Loaded: " .. lazy.stats().loaded .. "/" .. lazy.stats().count
			end,
		},
		lualine_z = {
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
			},
		},
	},
	filetypes = { "lazy" },
}
local neotree_ext = {
	sections = {
		lualine_a = {
			function()
				return "FILES"
			end,
		},
		lualine_y = {
			function()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
			end,
		},
	},
	filetypes = { "neo-tree" },
}
local blank_ext = {
	sections = {},
	filetypes = { "toggleterm" },
}

-- Setup
lualine.setup({
	options = {
		theme = shadoline,
		-- theme = "shado",
		section_separators = "",
		component_separators = "",
	},
	sections = sections,
	inactive_sections = sections,
	disabled_filetypes = {
		statusline = {
			"toggleterm",
		},
	},
	tabline = {},
	winbar = {},
	extensions = { lazy_ext, neotree_ext, blank_ext },
})
