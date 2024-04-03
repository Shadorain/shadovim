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

local dir_import = function(path, req_path)
	local check, _ = pcall(require, "plugins")
	if check then
		require("plugins")
		for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. path, [[v:val =~ '\.lua$']])) do
			if file ~= "init.lua" and file:sub(1, 1) ~= "_" then
				print(file)
				local ps = require(req_path .. file:gsub("%.lua$", ""))
				for _, plugin in ipairs(ps) do
					table.insert(plugins, plugin)
				end
			end
		end
	end
end

dir_import("/lua/shadovim/plugins", "shadovim.plugins.")
dir_import("/lua/plugins", "plugins.")

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
