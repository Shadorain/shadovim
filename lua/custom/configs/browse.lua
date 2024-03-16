function command(name, rhs, opts)
	opts = opts or {}
	vim.api.nvim_create_user_command(name, rhs, opts)
end

local bookmarks = {
	["github"] = {
		["name"] = "search github from neovim",
		["code_search"] = "https://github.com/search?q=%s&type=code",
		["repo_search"] = "https://github.com/search?q=%s&type=repositories",
		["issues_search"] = "https://github.com/search?q=%s&type=issues",
		["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
	},
}
command("BrowseInput", function()
	browse.input_search()
end, {})

command("Browse", function()
	browse.browse({ bookmarks = bookmarks })
end, {})

command("BrowseBookmarks", function()
	browse.open_bookmarks({ bookmarks = bookmarks })
end, {})

command("BrowseDevdocs", function()
	browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletype", function()
	browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdn", function()
	browse.mdn.search()
end, {})
