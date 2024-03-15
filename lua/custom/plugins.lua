local overrides = require("custom.configs.overrides")

return {
	-- Package Handling
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("tevim.plugins.lsp.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- Completion
	{
		"github/copilot.vim",
		lazy = true,
	},
	{
		"Exafunction/codeium.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("codeium").setup({})
		end,
	},

	-- Language Support
	{
	    'mrcjkb/rustaceanvim',
	    version = '^4',
	    ft = { 'rust' },
		lazy = true,
	},
	{
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		config = function()
			require('crates').setup()
		end,
		lazy = true,
	},
	{
	    'p00f/clangd_extensions.nvim',
	    ft = { 'c', "cpp" },
		lazy = true,
	},

	-- Utilities
	{
	  'tomasky/bookmarks.nvim',
		lazy = true,
		after = "telescope.nvim",
		event = "VimEnter",
		config = function()
			require('bookmarks').setup()
			require('telescope').load_extension('bookmarks')
		end
	},
	{
	  'LudoPinelli/comment-box.nvim',
		lazy = true,
		config = function()
			require('comment-box').setup()
		end
	},
	{
		'stevearc/aerial.nvim',
		dependencies = {
		   "nvim-treesitter/nvim-treesitter",
		   "nvim-tree/nvim-web-devicons"
		},
		config = function()
			require('aerial').setup({
			    on_attach = function(bufnr)
			        -- Jump forwards/backwards with '{' and '}'
			        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			    end,
			})
		end
	},
	{
		"Shatur/neovim-tasks",
		config = function()
			require('tasks').setup({
			  params_file = '.neovim.json', -- JSON file to store module and task parameters.
			  quickfix = {
				pos = 'botright', -- Default quickfix position.
				height = 15, -- Default height.
			  },
			})
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		requires = {
			"mfussenegger/nvim-dap"
		}
	},
	{
		"ravenxrz/DAPInstall.nvim",
		lazy = true,
	},
	{
    "nacro90/numb.nvim",
		lazy = true,
		config = function()
			require('numb').setup()
		end
	},
	{
    "filipdutescu/renamer.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
	{
    "tiagovla/scope.nvim",
    lazy = true,
		config = function()
			require('scope').setup()
		end
  },

  {
    "willothy/flatten.nvim",
    config = true,
    lazy = false, -- Ensure that it runs first to minimize delay when opening file from terminal
    priority = 1001,
  },
{
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
  },
  {
    "jghauser/mkdir.nvim",
    lazy = true,
    config = function()
      require('mkdir')
    end,
    event = "BufWritePre"
  },
  {
    "matbme/JABS.nvim",
    lazy = true,
  },
  {
    "nat-418/bufala.nvim",
    lazy = true,
    config = function()
      require('bufala').setup({
        layout = 'stack',
      })
    end,
  },
  {
    "nat-418/tabbot.nvim",
    lazy = true,
    config = function()
      require('tabbot').setup()
    end,
  },
	{
		"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		config = function()
			require('harpoon').setup({
			  menu = {
          width = 50,
          height = 8,
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
        }
			})
			require('telescope').load_extension('harpoon')
		end
	},
}
