local M = {}

function M.is_available(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.replaceword(middle, old, new, file)
	local lines = vim.fn.readfile(file)
	local new_lines = {}
	local found = false
	for _, line in ipairs(lines) do
		if line:find(middle) then
			if line:find(old) then
				table.insert(new_lines, middle .. " = " .. new)
			else
				table.insert(new_lines, middle .. " = " .. old)
			end
			found = true
		else
			table.insert(new_lines, line)
		end
	end
	if not found then
		table.insert(new_lines, middle .. " = " .. new)
	end
	vim.fn.writefile(new_lines, file)
end

function M.toggle_option(option)
	local value = not vim.api.nvim_get_option_value(option, {})
	vim.opt[option] = value
	-- M.replaceword("vim.opt." .. option, tostring(not value), tostring(value), vim.fn.stdpath("config") .. "/lua/config/options.lua")
	-- vim.notify(option .. " set to " .. tostring(value))
end

function M.build_run()
	local filetype = vim.bo.filetype
	if filetype == "c" then
		vim.cmd("TermExec cmd='gcc " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && " .. vim.fn.expand("%:r") .. "'")
	elseif filetype == "cpp" then
		vim.cmd("TermExec cmd='g++ " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && " .. vim.fn.expand("%:r") .. "'")
	elseif filetype == "python" then
		vim.cmd("TermExec cmd='python3 " .. vim.fn.expand("%") .. "'")
	elseif filetype == "javascript" then
		vim.cmd("TermExec cmd='node " .. vim.fn.expand("%") .. "'")
	elseif filetype == "typescript" then
		vim.cmd("TermExec cmd='ts-node " .. vim.fn.expand("%") .. "'")
	elseif filetype == "php" then
		vim.cmd("TermExec cmd='php " .. vim.fn.expand("%") .. "'")
	elseif filetype == "java" then
		vim.cmd("TermExec cmd='javac " .. vim.fn.expand("%") .. " && java " .. vim.fn.expand("%:r") .. "'")
	elseif filetype == "cs" then
		vim.cmd("TermExec cmd='mcs " .. vim.fn.expand("%") .. "'")
	elseif filetype == "rust" then
		vim.cmd("TermExec cmd='cargo run'")
	elseif filetype == "go" then
		vim.cmd("TermExec cmd='go run " .. vim.fn.expand("%") .. "'")
	elseif filetype == "lua" then
		vim.cmd("TermExec cmd='lua " .. vim.fn.expand("%") .. "'")
	elseif filetype == "sh" then
		vim.cmd("TermExec cmd='bash " .. vim.fn.expand("%") .. "'")
	elseif filetype == "dart" then
		vim.cmd("TermExec cmd='dart " .. vim.fn.expand("%") .. "'")
	elseif not M.is_available("markdown-preview.nvim") and filetype == "markdown" then
		vim.notify("You can install plugins support for markdown like markdown-preview.nvim ^^")
	elseif filetype == "html" and vim.fn.executable("live-server") ~= 1 then
		vim.notify("You can install live-server by npm ^^")
	elseif filetype == "html" then
		vim.cmd("TermExec cmd='live-server " .. vim.fn.expand("%:p:h") .. "'")
	elseif filetype == "markdown" then
		vim.cmd("MarkdownPreview")
	end
end

M.checkMason = function()
	local status_ok, _ = pcall(require, "mason")
	if not status_ok then
		return vim.notify("mason.nvim isn't installed!")
	end
	local mason_packages = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/*", 0, 1)
	local mason_installed = {}
	for _, package in ipairs(mason_packages) do
		table.insert(mason_installed, vim.fn.fnamemodify(package, ":t"))
	end
	local ensure_installed = require("plugins.lsp.overrides").mason.ensure_installed
	local default_mason = { "lua-language-server", "stylua" }
	for _, package in ipairs(default_mason) do
		table.insert(ensure_installed, package)
	end
	local missing = {}
	for _, package in ipairs(ensure_installed) do
		if not vim.tbl_contains(mason_installed, package) then
			table.insert(missing, package)
		end
	end
	local remove = {}
	for _, package in ipairs(mason_installed) do
		if not vim.tbl_contains(ensure_installed, package) then
			table.insert(remove, package)
		end
	end
	if #remove > 0 then
		vim.cmd("MasonUninstall " .. table.concat(remove, " "))
	end
	if #missing > 0 then
		vim.cmd("MasonInstall " .. table.concat(missing, " "))
	end
end

M.ShadovimUpdate = function()
	vim.cmd("silent !git -C pull")
	vim.cmd("silent Lazy sync")
	vim.notify("Shadovim updated")
end

return M
