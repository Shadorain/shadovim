return {
	"lewis6991/gitsigns.nvim",
	ft = { "gitcommit", "diff" },
	init = function()
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
			callback = function()
				vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
					on_exit = function(_, return_code)
						if return_code == 0 then
							vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
							vim.schedule(function()
								require("lazy").load({ plugins = { "gitsigns.nvim" } })
							end)
						end
					end,
				})
			end,
			desc = "Load gitsigns only if git repository",
		})
	end,
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "│" },
			topdelete = { text = "│" },
			changedelete = { text = "│" },
			untracked = { text = "┆" },
		},
		preview_config = {
			border = "rounded",
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })
		end,
	},
}
