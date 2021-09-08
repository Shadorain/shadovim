--[[ ========================================================================
"  .__       .__  __     .__                
"  |__| ____ |__|/  |_   |  |  __ _______   
"  |  |/    \|  \   __\  |  | |  |  \__  \  
"  |  |   |  \  ||  |    |  |_|  |  // __ \_
"  |__|___|  /__||__| /\ |____/____/(____  /
"          \/         \/                 \/ 
" =========================================================================== ]]
-- [[ Startup ]] ------------------------------------------------------------ ]]
--- Speed up {{{
--> [[[ Credits to Vhyrro for these tips here ]]] <--
vim.opt.shadafile = "NONE"
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
--- }}}
--- Sourcing {{{
require('plugins')
require('config')
require('binds')
require('lsp_config')

vim.opt.shadafile = ""
vim.opt.termguicolors = true
vim.cmd [[
	rshada!
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	syntax enable
	colorscheme shado
]]

vim.defer_fn(function()
	vim.cmd [[
		set t_ut=
		silent! bufdo e
		PackerLoad impatient.nvim
		PackerLoad lightline.vim
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
	]]
end, 15)
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
