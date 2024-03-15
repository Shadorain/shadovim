--[[ ========================================================================
"  __________.__               .__                   .__
"  \______   \  |  __ __  ____ |__| ____   ______    |  |  __ _______
"   |     ___/  | |  |  \/ ___\|  |/    \ /  ___/    |  | |  |  \__  \
"   |    |   |  |_|  |  / /_/  >  |   |  \\___ \     |  |_|  |  // __ \_
"   |____|   |____/____/\___  /|__|___|  /____  > /\ |____/____/(____  /
"                      /_____/         \/     \/  \/                 \/
" =========================================================================== ]]
local M = {}
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

  -- [[ Custom ]]
  use { 'Shadorain/shadotheme', after = "nvim-treesitter" }

  -- [[ Speed up ]] DEPRECATED
  use { 'lewis6991/impatient.nvim', opt = true, config = function() require('impatient') end }

  -- [[ Utility ]]
  use { 'nvim-lua/plenary.nvim' }        --- general utilities
  use { 'vim-scripts/genutils' }         --- general utilities
  use { 'MattesGroeger/vim-bookmarks' }  --- bookmarks
  use { 'voldikss/vim-floaterm' }        --- Terminal
  use { 'edluffy/specs.nvim' }           --- cursor beacon
  use { 'godlygeek/tabular' }            --- tabbing
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim' }        --- commenting
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'LudoPinelli/comment-box.nvim' }
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  use { 'leoluz/nvim-dap-go', ft = "go", dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  }
  use { 'ravenxrz/DAPInstall.nvim' }
  use { 'ray-x/go.nvim' }
  use { 'ray-x/guihua.lua' }
  use { 'ahmedkhalf/project.nvim' }
  use { 'nacro90/numb.nvim' }
  use { 'rcarriga/nvim-notify' }
  use { 'filipdutescu/renamer.nvim' }
  use { 'tiagovla/scope.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'tamago324/lir.nvim' }
  use { 'LunarVim/peek.lua' }
  use { 'gbprod/stay-in-place.nvim' }
  use { 'danymat/neogen' }
  use { 'folke/which-key.nvim' }
  use { 'mbbill/undotree' }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'echasnovski/mini.nvim' }
  use { 'edluffy/hologram.nvim', ft = {'norg', 'md'} }
  use { 'ekickx/clipboard-image.nvim' }
  -- use { "folke/noice.nvim" }
  use { 'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
      tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = '<C-d>', -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = true, -- if the tabkey is used in a completion pum
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {} -- tabout will ignore these filetypes
    }
    end,
	  wants = {'nvim-treesitter'}, -- or require if not used so far
	  after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }
  use { 'folke/zen-mode.nvim' }

  -- [[ Git integration ]]
  use { 'nvim-lua/popup.nvim' }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'kdheepak/lazygit.nvim' }
  use { 'pwntester/octo.nvim' }

  -- [[ Coding ]]
  --- [[ LSP & Completion ]] {{{
  use { 'neovim/nvim-lspconfig' } --- Native LSP
  use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' }
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
  use { 'hrsh7th/cmp-nvim-lsp' }
  -- use { 'github/copilot.vim' }
  use { 'zbirenbaum/copilot.lua',
    -- after = 'lualine.nvim',
    -- after = 'statline.nvim',
    config = function()
      vim.defer_fn(function()
        require('copilot').setup {
          panel = { enabled = true, },
          ft_disable = { "markdown" },
          copilot_node_command = 'node', -- Node version must be < 18
          plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
          server_opts_overrides = {},
        }
      end, 100)
    end,
  }
  use { 'zbirenbaum/copilot-cmp', after = 'copilot.lua' }

  use { 'onsails/lspkind-nvim' }
	use { 'ray-x/lsp_signature.nvim', module = 'lsp_signature' }
  use { 'rafamadriz/friendly-snippets' } --- extra snippets
	-- use { 'simrat39/symbols-outline.nvim', cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" } }
	use { 'stevearc/aerial.nvim' }
  --- }}}
  --- [[ Treesitter ]] {{{
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
  use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' }
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
  use { 'windwp/nvim-ts-autotag' }
    --- }}}
  --- [[ Languages ]]
  use { 'sheerun/vim-polyglot' }     --- *
  use { 'rust-lang/rust.vim' }       --- rust!
  use { 'arzg/vim-rust-syntax-ext' } --- rust: syntax extension
  use { 'simrat39/rust-tools.nvim' } --- rust: loads of tools
  use { 'saecki/crates.nvim' }       --- cargo crates!
  use { 'p00f/clangd_extensions.nvim' } --- C++
  use { 'Shatur/neovim-tasks' } --- CMake/Cargo
  use { 'MunifTanjim/prettier.nvim' }
  -- use { 'nvim-neorg/neorg', -- tag = "ab065a4c53a7877f6b046d27d8a17f81912c0d6b",
  --   -- config = function()
  --   --   require("neorg").setup(require("config").norg)
  --   -- end,
  --   -- run = ":Neorg sync-parsers",
  --   -- ft = "norg",
  --   -- after = "nvim-treesitter",
  --   requires = {"nvim-neorg/neorg-telescope", "max397574/neorg-kanban", "max397574/neorg-contexts"},
  -- }

  -- [[ Make it pretty ]]
  use { 'kyazdani42/nvim-web-devicons' }      --- icons
  use { 'norcalli/nvim-colorizer.lua' }       --- Colorizer
  -- use { 'nvim-colortils/colortils.nvim' }     --- Colorpicker!
  use { 'xiyaowong/nvim-transparent' }        --- transparency
  -- use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'tamton-aquib/staline.nvim' }
  use { 'tamton-aquib/stuff.nvim' }
  use { 'willothy/flatten.nvim' }
  -- use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'RRethy/vim-illuminate' }
  use { 'stevearc/dressing.nvim' }
  use { 'ghillb/cybu.nvim' }
  -- use { 'samodostal/image.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'levouh/tint.nvim' }
  -- use { 'lukas-reineke/headlines.nvim' }

  -- [[ Finders ]]
  use { 'nvim-telescope/telescope.nvim' } --- file/buffer/etc
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'lalitmee/browse.nvim', requires = { 'nvim-telescope/telescope.nvim' } }
  use { 'phaazon/hop.nvim' }              --- easymotion movement
  use { 'matbme/JABS.nvim' }              --- Buffer Switching
  use { 'theprimeagen/harpoon' }          --- Buffer Harpooning
  use { 'SmiteshP/nvim-navic' }           --- Navigation

  -- [[ Miscellaneous ]]
  use { 'goolord/alpha-nvim' }
  use { 'Shatur/neovim-session-manager' }
  use { 'jghauser/mkdir.nvim', config = function() require('mkdir') end, event = "BufWritePre" }
  use { 'jbyuki/venn.nvim' }
  use { 'nat-418/bufala.nvim' }
  use { 'nat-418/tabbot.nvim' }
end)
-- [[ ----------------------------------------------------------------------- ]]
