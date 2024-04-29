local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local is_available = require("shadovim.config.utils").is_available

autocmd("BufWritePre", {
	group = augroup("create_dir", { clear = true }),
	callback = function(args)
		if args.match:match("^%w%w+://") then
			return
		end
		vim.fn.mkdir(vim.fn.fnamemodify(vim.loop.fs_realpath(args.match) or args.match, ":p:h"), "p")
	end,
	desc = "Automatically create parent directories if they don't exist when saving a file",
})

if is_available("neo-tree.nvim") then
	autocmd("TermClose", {
		pattern = "*lazygit*",
		group = augroup("neotree_refresh", { clear = true }),
		callback = function()
			local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
			if manager_avail then
				for _, source in ipairs({ "filesystem", "git_status", "document_symbols" }) do
					local module = "neo-tree.sources." .. source
					if package.loaded[module] then
						manager.refresh(require(module).name)
					end
				end
			end
		end,
		desc = "Refresh Neo-Tree when closing lazygit",
	})
end

-- Diagnostics
autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float({
			border = "rounded",
			scope = "cursor",
			focusable = false,
			max_width = 60,
		})
	end,
	desc = "Open Float Window for LSP Diagnostics",
})

-- autocmd({ "TermOpen", "BufEnter" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		if vim.opt.buftype:get() == "terminal" then
-- 			vim.opt_local.winbar = nil
-- 			vim.cmd("startinsert")
-- 		end
-- 	end,
-- 	desc = "Start insert in terminal",
-- })

autocmd("FileType", {
	pattern = {
		"neo-tree",
		"PlenaryTestPopup",
		"checkhealth",
		"fugitive",
		"git",
		"gitcommit",
		"help",
		"lazy",
		"lazyterm",
		"lspinfo",
		"man",
		"mason",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"Trouble",
		"trouble",
		"toggleterm",
	},
	callback = function()
		vim.opt_local.winbar = nil
		vim.opt_local.number = false
		vim.opt_local.cursorline = false
		vim.opt_local.foldcolumn = "0"
		vim.opt_local.signcolumn = "no"
		vim.b.miniindentscope_disable = true
	end,
	desc = "Disable miniindentscope, number and cursorline in specific filetypes",
})

autocmd("BufWinEnter", {
	group = augroup("q_close_windows", { clear = true }),
	callback = function(args)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
		if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
			vim.keymap.set("n", "q", "<cmd>close<cr>", {
				desc = "Close window",
				buffer = args.buf,
				silent = true,
				nowait = true,
			})
		end
	end,
	desc = "Make q close help, man, quickfix, dap floats",
})

autocmd("FileType", {
	group = augroup("unlist_quickfist", { clear = true }),
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
	desc = "Don't list quickfix buffer",
})

autocmd("BufWritePost", {
	pattern = vim.fn.stdpath("config") .. "/lua/*.lua",
	group = augroup("ShadovimReload", { clear = true }),
	callback = function(opts)
		local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r")
		local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
		local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")
		vim.cmd("silent source %")
		require("plenary.reload").reload_module(module)
		require("plenary.reload").reload_module("config")
	end,
	desc = "Reload neovim config on save",
})

-- Create custom command
vim.api.nvim_create_user_command("ShadovimUpdate", function()
	require("shadovim.config.utils").ShadovimUpdate()
end, {})
vim.api.nvim_create_user_command("ShadovimCheckMason", function()
	require("shadovim.config.utils").checkMason()
end, {})
