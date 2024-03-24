require("rainbow-delimiters.setup").setup({
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
})

return {
	ensure_installed = { "lua", "vim", "vimdoc", "rust", "cpp", "css", "json", "markdown" },
	auto_install = false,

	highlight = {
		enable = true,
		use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gni",
			scope_incremental = "gns",
			node_decremental = "gnd",
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	textsubjects = {
		enable = true,
		keymaps = { [","] = "textsubjects-smart" },
	},

	indent = { enable = true },
	autotag = { enable = true },

	playground = {
		enable = true,
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "I",
			toggle_language_display = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	tree_docs = { enable = false }, -- Currently experimental, doesn't work well
	context_commentstring = { enable = true },
}
