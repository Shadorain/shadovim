--[[ ========================================================================
"  __________.__               .__                   .__                
"  \______   \  |  __ __  ____ |__| ____   ______    |  |  __ _______   
"   |     ___/  | |  |  \/ ___\|  |/    \ /  ___/    |  | |  |  \__  \  
"   |    |   |  |_|  |  / /_/  >  |   |  \\___ \     |  |_|  |  // __ \_
"   |____|   |____/____/\___  /|__|___|  /____  > /\ |____/____/(____  /
"                      /_____/         \/     \/  \/                 \/
" =========================================================================== ]]
local fn = vim.fn
-- [[ Setup ]] -------------------------------------------------------------- ]]
--- Install {{{
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
--- }}}
--- Run {{{
vim.cmd('packadd packer.nvim')
--- }}}
-- [[ Plugins ]] ------------------------------------------------------------ ]]
return require('packer').startup(function(use)
    -- Packer itself
    use { 'wbthomason/packer.nvim' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Start Screen
    use { 'mhinz/vim-startify' }
end)
-- [[ ----------------------------------------------------------------------- ]]
