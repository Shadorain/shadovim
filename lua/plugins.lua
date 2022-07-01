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
require('packer').init({
	git = { clone_timeout = 350, },
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" }
	}
})
--- }}}
-- [[ Plugins ]] ------------------------------------------------------------ ]]
return require('packer').startup(function(use)
    -- [[ Packer ]]
    use { 'wbthomason/packer.nvim' }

    -- [[ Speed up ]]
    use { 'lewis6991/impatient.nvim', opt = true, config = function() require('impatient') end }

    -- [[ Utility ]]
    use { 'nvim-lua/plenary.nvim' }        --- general utilities
    use { 'vim-scripts/genutils' }         --- general utilities
    use { 'MattesGroeger/vim-bookmarks' }  --- bookmarks
    use { 'voldikss/vim-floaterm' }        --- Terminal
    use { 'edluffy/specs.nvim' }           --- cursor beacon
    use { 'qpkorr/vim-bufkill' }           --- kill buffers properly
    use { 'godlygeek/tabular' }            --- tabbing
    use { 'jiangmiao/auto-pairs' }
    use { 'numToStr/Comment.nvim' }        --- commenting
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { "ravenxrz/DAPInstall.nvim" }
    use { 'ahmedkhalf/project.nvim' }

    -- [[ Git integration ]]
    use { 'nvim-lua/popup.nvim' }
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- [[ Coding ]]
    --- [[ LSP & Completion ]] {{{
    use { 'neovim/nvim-lspconfig' } --- Native LSP
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/nvim-cmp', requires = { --- Autocompletion
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'delphinus/cmp-ctags', after = 'nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
      },
    }
    use { 'onsails/lspkind-nvim' }
	use { 'ray-x/lsp_signature.nvim', module = 'lsp_signature' }
    use { 'rafamadriz/friendly-snippets' } --- extra snippets
	use { "simrat39/symbols-outline.nvim", cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" } }
    --- }}}
    --- [[ Treesitter ]] {{{
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
    use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
	use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' }
	use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
    --- }}}
    --- [[ Languages ]]
    use { 'sheerun/vim-polyglot' }     --- *
    use { 'rust-lang/rust.vim' }       --- rust!
    use { 'arzg/vim-rust-syntax-ext' } --- rust: syntax extension
    use { 'simrat39/rust-tools.nvim' } --- rust: loads of tools
    use { 'saecki/crates.nvim' }       --- cargo crates!
    use { 'nvim-neorg/neorg' } --, after = "nvim-treesitter" }

    -- [[ Make it pretty ]]
    use { 'kyazdani42/nvim-web-devicons' }      --- icons
    use { 'norcalli/nvim-colorizer.lua' }       --- Colorizer
    use { 'junegunn/goyo.vim' }                 --- focus
    use { 'xiyaowong/nvim-transparent' }        --- transparency
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'kdheepak/tabline.nvim', requires = { {'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true} } }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'RRethy/vim-illuminate' }

    -- [[ Finders ]]
    use { 'nvim-telescope/telescope.nvim' } --- file/buffer/etc
    use { 'unblevable/quick-scope' }        --- horizonal movement

    -- [[ Miscellaneous ]]
    use { 'mhinz/vim-startify' } --- Start Screen
    use { 'jghauser/mkdir.nvim', config = function() require('mkdir') end, event = "BufWritePre" }
end)
-- [[ ----------------------------------------------------------------------- ]]
