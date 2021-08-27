--[[ ========================================================================
"  __________.__               .__                   .__                
"  \______   \  |  __ __  ____ |__| ____   ______    |  |  __ _______   
"   |     ___/  | |  |  \/ ___\|  |/    \ /  ___/    |  | |  |  \__  \  
"   |    |   |  |_|  |  / /_/  >  |   |  \\___ \     |  |_|  |  // __ \_
"   |____|   |____/____/\___  /|__|___|  /____  > /\ |____/____/(____  /
"                      /_____/         \/     \/  \/                 \/
" =========================================================================== ]]
-- [[ Setup ]] -------------------------------------------------------------- ]]
--- Install {{{
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
--- }}}
--- Run {{{
vim.cmd[[packadd packer.nvim]]
--- }}}
-- [[ Plugins ]] ------------------------------------------------------------ ]]
return require('packer').startup(function(use)
    -- [[ Packer ]]
    use { 'wbthomason/packer.nvim' }

    -- [[ Coding ]]
    use { 'kabouzeid/nvim-lspinstall' } --- native LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } --- treesitter
    -- use {'hrsh7th/nvim-compe',
    --     config = function() require('plugins.compe') end,
    -- } --- Completion
    --- [[ Languages ]]
    use { 'sheerun/vim-polyglot' }     --- *
    use { 'rust-lang/rust.vim' }       --- rust!
    use { 'arzg/vim-rust-syntax-ext' } --- rust: syntax extension
    use { 'simrat39/rust-tools.nvim' } --- rust: loads of tools
    use { 'plasticboy/vim-markdown' }  --- markdown

    -- [[ Utility ]]
    use { 'MattesGroeger/vim-bookmarks' } --- bookmarks
    use { 'tpope/vim-commentary' }        --- commenting
    use { 'voldikss/vim-floaterm' }       --- Terminal
    use { 'vim-scripts/genutils' }        --- general utilities
    use { 'godlygeek/tabular' }           --- tabbing
    use { 'mfussenegger/nvim-dap' }       --- debugging
    use { 'honza/vim-snippets' }          --- snippets

    -- [[ Make it pretty ]]
    use { 'kyazdani42/nvim-web-devicons' } --- icons
    use { 'itchyny/lightline.vim' }        --- Statusbar
    use { 'junegunn/goyo.vim' }            --- focus

    -- [[ Git integration ]]
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'airblade/vim-gitgutter' }

    -- [[ Finders ]]
    use { 'nvim-telescope/telescope.nvim' } --- file/buffer/etc
    use { 'unblevable/quick-scope' }        --- horizonal movement
    use { 'phaazon/hop.nvim' }              --- vertical movement
    use { 'justinmk/vim-sneak' }            --- both movement
    use { 'mileszs/ack.vim' }               --- searcher

    -- [[ Miscellaneous ]]
    use { 'mhinz/vim-startify' } --- Start Screen
end)
-- [[ ----------------------------------------------------------------------- ]]
