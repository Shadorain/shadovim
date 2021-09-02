--[[ ========================================================================
"  .__       .__  __     .__                
"  |__| ____ |__|/  |_   |  |  __ _______   
"  |  |/    \|  \   __\  |  | |  |  \__  \  
"  |  |   |  \  ||  |    |  |_|  |  // __ \_
"  |__|___|  /__||__| /\ |____/____/(____  /
"          \/         \/                 \/ 
" =========================================================================== ]]
-- [[ Startup ]] ------------------------------------------------------------ ]]
--- Load later {{{
-- vim.cmd [[
--     syntax off
--     filetype off
--     filetype plugin indent off
-- ]]
--- }}}
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
--> [[[ Credits to Vhyrro for these tips here ]]] <--
--- Load after vim is fully loaded
vim.opt.termguicolors = true
vim.cmd [[
	syntax enable
	colorscheme xshado
]]

vim.cmd('source ~/.config/nvim/lua/cocsetup.vim')
require('plugins')
require('config')
require('binds')

-- vim.defer_fn(function()
vim.opt.shadafile = ""
vim.cmd [[
	rshada!
	doautocmd BufRead
	filetype on
	filetype plugin indent on
]]

vim.defer_fn(function()
	vim.cmd [[
		set t_ut=
		silent! bufdo e
		PackerLoad lightline.vim
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
		colorscheme xshado
	]]
end, 15)
-- require('lsp_config')
-- vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
-- end, 0)
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
