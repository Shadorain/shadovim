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
	laststatus = 3, -- Set to 2 to have bar per window

	-- Undo
	undofile = true,
	undodir = os.getenv("HOME") .. "/.local/cache/nvim/undo/",
	backupdir = os.getenv("HOME") .. "/.local/cache/nvim/backups/",

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
	cmdheight = 0,
	sessionoptions = "tabpages,globals,blank,buffers,curdir,folds,help,winsize,winpos,terminal",
	conceallevel = 2,
	listchars = "space:·",
	virtualedit = "block",
	mousefocus = true,
	inccommand = "split",
	showtabline = 0,

	textwidth = 0,
	wrapmargin = 0,
	wrap = false,

	clipboard = "",
	shortmess = vim.o.shortmess .. "F",
}

for k, v in pairs(options) do
	if vim.fn.has("nvim-0.10") == 1 then
		vim.loader.enable()
		vim.opt.smoothscroll = true
	end
	vim.opt[k] = v
end
