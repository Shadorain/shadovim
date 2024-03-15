return {
	ensure_installed = { "lua", "vim", "vimdoc", "rust", "cpp", "css", "json", "markdown" },
	auto_install = false,

	highlight = {
		enable = true,
		use_languagetree = true,
	},
  rainbow = {
	  enable = true,
	  extended_mode = true,
	  max_file_lines = 1000,
	  colors = { '#B52A5B', '#FF4971', '#bd93f9', '#E9729D', '#F18FB0', '#8897F4', '#b488bf' },
  },

	indent = { enable = true },
  autotag = { enable = true },

  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'I',
      toggle_language_display = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  tree_docs = { enable = false }, -- Currently experimental, doesn't work well
  context_commentstring = { enable = true },
}
