local plugins = {
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		cmd = "TodoTelescope",
		opts = { signs = false },
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure({ filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } })
		end,
	},
	{
		"phaazon/hop.nvim",
		keys = { "f", "F", "t", "T", "s", "S" },
		branch = "v2",
		opts = { keys = "etovxqpdygfblzhckisuran", case_insensitive = false },
	},
	{ "MunifTanjim/nui.nvim", dependencies = "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "mbbill/undotree" },
	{ "j-hui/fidget.nvim", opts = {} },

	-----------------------------------------------------------------------------
	{ "filipdutescu/renamer.nvim", requires = { "nvim-lua/plenary.nvim" }, opts = { border = true } },
	{ "stevearc/overseer.nvim", cmd = { "OverseerToggle", "OverseerRun", "OverseerBuild" }, opts = { dap = false } },
	{ "danymat/neogen", cmd = { "Neogen" }, config = true },
	{ "gbprod/stay-in-place.nvim", event = "BufWinEnter", config = true },
	{ "nacro90/numb.nvim", event = "BufWinEnter", config = true },
	{
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
		config = function()
			require("mkdir")
		end,
	},
}

local function dir_import(path, ignore_root)
	local results = {}

	if not ignore_root then -- Evaluate the root dir
		local result = require(path) or {}

		if type(result) == "table" then
			vim.list_extend(results, result)
		end
	end

	local fullpath = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", (path:gsub("%.", "/")))

	local function skip(dir)
		return not vim.uv.fs_stat(vim.fs.joinpath(fullpath, dir, "init.lua"))
	end

	for file, ft in vim.fs.dir(fullpath) do
		if (vim.endswith(file, ".lua") and file ~= "init.lua") or (ft == "directory" and not skip(file)) then
			local result = require(table.concat({ path, (file:gsub("%..*$", "")) }, ".")) or {}

			if type(result) == "table" then
				if type(result[1]) == "table" then
					vim.list_extend(results, result)
				else
					table.insert(results, result)
				end
			end
		end
	end

	return results
end

vim.list_extend(plugins, dir_import("shadovim.plugins", true))
vim.list_extend(plugins, dir_import("plugins"))

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
