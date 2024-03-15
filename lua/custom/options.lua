-- Globals
vim.g.TeVimTheme = "yoru"
vim.g.transparency = true
vim.g.loadTeDash = true -- Loads Dashboard

-- Options
local options = {
  -- Tab Configuration
  smartindent = true,
	smarttab = true,
	autoindent = true,
	copyindent = true,
	preserveindent = true,

	-- Numbering
	relativenumber = true,
	ruler = false,

	-- Folds
	-- foldmethod = 'marker',

	-- Status line
	laststatus = 2,

	-- Undo
	undofile = true,
	undodir = "/home/shadow/.local/cache/nvim/undo/",
	backupdir = "/home/shadow/.local/cache/nvim/backups/",

	-- Pumemu
	pumwidth = 15,
	pumheight = 7,
	pumblend = 20,
	winblend = 20,

	-- Update times
	updatetime = 150,

	-- Miscellaneous
	expandtab = true,

	-- Cursor
	cursorline = true,
	cursorlineopt = "number",
  
	-- Miscellaneous
	path = "$PWD/**",
  sessionoptions = "tabpages,globals,blank,buffers,curdir,folds,help,winsize,winpos,terminal",
  conceallevel = 2,
  listchars = 'space:·',
  virtualedit = "block",
  mousefocus = true,
  inccommand = "split",
}

for k, v in pairs(options) do
	if vim.fn.has("nvim-0.10") == 1 then
		vim.loader.enable()
		vim.opt.smoothscroll = true
	end
	vim.opt[k] = v
end
