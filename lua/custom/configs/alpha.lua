local alpha = require("alpha")
local path = require("plenary.path")

local dashboard = require("alpha.themes.dashboard")
local nvim_web_devicons = require("nvim-web-devicons")
local cdir = vim.fn.getcwd()

local logo = {
	type = "text",
	val = {
		-- [[  _________  __                  ___                        __         ]],
		-- [[ /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____  ]],
		-- [[ \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \ ]],
		-- [[ /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \]],
		-- [[/_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /]],
		-- [[        \/       \/      \/      \/                    \/          \/  ]],
		[[                                        ████                          ]],
		[[                                        ████████                      ]],
		[[                    ██                  ██████████                    ]],
		[[                  ████                  ████  ████                    ]],
		[[                ██████                  ██    ████▓▓                  ]],
		[[                ██  ██▓▓              ▓▓██      ████                  ]],
		[[                ██  ████▓▓            ████      ████▓▓                ]],
		[[              ▓▓██    ████▓▓      ▓▓▓▓██        ██████                ]],
		[[              ██      ██████▓▓▓▓▓▓██████          ████▓▓              ]],
		[[              ██    ▓▓██████████████████▓▓        ██████              ]],
		[[              ██  ▒▒██████████████████████▓▓██    ██████              ]],
		[[              ██▓▓████████████████████████████  ▓▓██████▓▓            ]],
		[[              ████████████████████████████████▓▓██████████▓▓▓▓        ]],
		[[            ▓▓████  ██████    ██████████████████████████████████      ]],
		[[            ████    ████      ██████████████████████████████████      ]],
		[[          ▓▓██      ██            ██████████████████████████████▓▓    ]],
		[[          ██████  ▓▓██      ▓▓████    ████████████████████████████    ]],
		[[          ██████  ████  ██████████████      ██████████████████████    ]],
		[[          ░░██    ██░░▓▓██████████░░          ░░██████████████████▓▓  ]],
		[[        ████░░  ▓▓██  ██████░░░░░░              ░░██████████████████  ]],
		[[    ▓▓▓▓░░      ░░░░  ░░██░░                      ░░████████████████░░]],
		[[████████████                                        ██████████████████]],
		[[██████████████                                        ████████████████]],
		[[██████████████                                        ████████████████]],
		[[████████████░░                                        ████████████████]],
		[[░░████████░░                                          ████████████████]],
		[[  ██████                                            ██████████████████]],
		[[  ████████                  ████                    ██████████████████]],
		[[  ████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                    ██████████████████]],
		[[  ░░████████████████████░░░░                      ▒▒██████████████████]],
		[[    ████████░░░░░░░░░░░░  ██▒▒                    ████████████████████]],
		[[    ░░░░████▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                    ████████████████████]],
		[[            ██████████                          ██████████████████████]],
		[[            ████████                            ██████████████████████]],
		[[            ████████                          ████████████████████████]],
		[[            ██████████                      ████████████████████████  ]],
		[[          ██████████████                    ████████████████████████  ]],
		[[          ██████████████                  ████████████████  ████████  ]],
		[[        ████████    ██████              ████████████████    ██████    ]],
		[[        ██████      ██████            ████████████████░░      ████    ]],
		[[      ████████        ████          ████████████████          ████    ]],
		[[    ██████████        ████        ████████████████              ██    ]],
		[[      ██████████    ████        ██████████████                        ]],
		[[          ████████          ██████████████                            ]],
		[[              ████████████████████████                                ]],
	},
	opts = {
		position = "center",
		hl = "AlphaLogo",
	},
}
-- Info Text
local function info_value()
	-- local plugins = string.format(" %d", vim.tbl_count(packer_plugins))
	local datetime = os.date(" %d-%m-%Y")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return "" .. datetime .. nvim_version_info
end

local info = {
	type = "text",
	val = info_value(),
	opts = {
		hl = "StringDelimiter",
		position = "center",
	},
}
-- Header Group
local header = {
	type = "group",
	val = {
		{ type = "padding", val = 2 },
		logo,
		{ type = "padding", val = 1 },
		info,
		{ type = "padding", val = 2 },
	},
}
local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
	short_fn = short_fn or fn
	local ico_txt
	local fb_hl = {}

	local ico, hl = icon(fn)
	local hl_option_type = type(nvim_web_devicons.highlight)
	if hl_option_type == "boolean" then
		if hl and nvim_web_devicons.highlight then
			table.insert(fb_hl, { hl, 0, 1 })
		end
	end
	if hl_option_type == "string" then
		table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
	end
	ico_txt = ico .. "  "

	local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
	local fn_start = short_fn:match(".*/")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
	end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end
local default_mru_ignore = { "gitcommit" }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext)) or (string.find(path, "/jot/"))
	end,
}
--- @param start number
--- @param cwd string optional
--- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = items_number or 9

	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end

	local special_shortcuts = { "a", "s", "d" }
	local target_width = 35

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = vim.fn.fnamemodify(fn, ":.")
		else
			short_fn = vim.fn.fnamemodify(fn, ":~")
		end

		if #short_fn > target_width then
			short_fn = path.new(short_fn):shorten(1, { -2, -1 })
			if #short_fn > target_width then
				short_fn = path.new(short_fn):shorten(1, { -1 })
			end
		end

		local shortcut = ""
		if i <= #special_shortcuts then
			shortcut = special_shortcuts[i]
		else
			shortcut = tostring(i + start - 1 - #special_shortcuts)
		end

		local file_button_el = file_button(fn, shortcut, short_fn)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

local section_mru = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent files",
			opts = {
				hl = "String",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "padding", val = 1 },
		{
			type = "group",
			val = function()
				return { mru(1, cdir, 9) }
			end,
			opts = { shrink_margin = false },
		},
	},
}

local buttons = {
	type = "group",
	val = {
		dashboard.button("i", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
		dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
		-- dashboard.button("g", "  Live grep", '<cmd>lua require("telescope.builtin").live_grep({shorten_path=true})<CR>'),
		dashboard.button("S", "  Open sesion", "<cmd>lua require('resession').load()<CR>"),
		dashboard.button("L", "  Last sesion", "<cmd>lua require('resession').load('last')<CR>"),
		-- dashboard.button("T", "  Todos", "<cmd>Neorg workspace gtd<CR>"),
		-- dashboard.button("J", "  Journal", "<cmd>Neorg journal today<CR>"),
		-- dashboard.button("M", "  Neorg main", "<cmd>Neorg workspace main<CR>"),
		dashboard.button("P", "  Lazy Update", "<cmd>Lazy sync<CR>"),
		dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
	},
	position = "center",
}

local bookmarks = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Bookmarks",
			opts = {
				hl = "String",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "padding", val = 1 },
		dashboard.button("nv", "  Autocommands", "<cmd>e ~/.config/nvim/custom/autocommands.lua<cr>"),
		dashboard.button("np", "  Plugins", "<cmd>e ~/.config/nvim/lua/custom/plugins.lua<cr>"),
		dashboard.button("nc", "  Options", "<cmd>e ~/.config/nvim/lua/custom/options.lua<cr>"),
		dashboard.button("nk", "  Keybinds", "<cmd>e ~/.config/nvim/lua/tevim/core/keymaps.lua<cr>"),
		dashboard.button("nx", "  Shadotheme", "<cmd>e ~/dev/shadotheme/colors/shado.lua<cr>"),
		dashboard.button("ch", "  Hyprland", "<cmd>e ~/.config/hypr/hyprland.conf<cr>"),
		dashboard.button("cw", "  Waybar", "<cmd>e ~/.config/waybar/config<cr>"),
		dashboard.button("ck", "  Kitty", "<cmd>e ~/.config/kitty/kitty.conf<cr>"),
		dashboard.button("zc", "  Zshrc", "<cmd>e ~/.zshrc<cr>"),
		dashboard.button("za", "  Zsh Aliases", "<cmd>e ~/.zsh_aliases<cr>"),
		dashboard.button("ze", "  Zsh Environment", "<cmd>e ~/.zshenv<cr>"),
	},
	opts = { position = "center" },
}

vim.api.nvim_create_autocmd("FileType", { pattern = { "alpha" }, command = "setlocal nofoldenable" })

alpha.setup({
	layout = {
		{ type = "padding", val = 1 },
		header,
		{ type = "padding", val = 2 },
		buttons,
		{ type = "padding", val = 2 },
		bookmarks,
		{ type = "padding", val = 2 },
		section_mru,
	},
	setup = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			desc = "Disable status, and cmdline for alpha",
			callback = function()
				vim.go.laststatus = 0
				vim.opt.cmdheight = 0
			end,
		})
		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			desc = "Enable status and cmdline after alpha",
			callback = function()
				vim.go.laststatus = 3
				vim.opt.cmdheight = 1
			end,
		})
	end,
	opts = {
		margin = 5,
	},
})
