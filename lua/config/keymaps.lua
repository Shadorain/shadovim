local M = {}

-- Leader
M.whichkeys = function()
	local m_mappings = {
		["m"] = {
			name = "  BOOKMARKS",
			-- Bookmarks
			A = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
			B = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
			C = { "<cmd>silent BookmarkClear<cr>", "Clear" },
			X = { "<cmd>silent BookmarkClearAll<cr>", "Clear All" },
			j = { "<cmd>silent BookmarkNext<cr>", "Next" },
			k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
			S = { "<cmd>silent BookmarkShowAll<cr>", "Show" },

			-- Harpoon
			m = { '<cmd>lua require("harpoon"):list():append()<cr>', "Harpoon" },
			["."] = { '<cmd>lua require("harpoon"):list():prev()<cr>', "Harpoon Next" },
			[","] = { '<cmd>lua require("harpoon"):list():next()<cr>', "Harpoon Prev" },
			[";"] = { '<cmd>lua require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())<cr>', "Harpoon UI" },
		},
	}
	local v_mappings = {
		d = {
			name = "+debug",
			K = { '<cmd>lua require("dap.ui.variables").visual_hover()<cr>', "Range Hover" },
		},
	}
	local t_mappings = {
		b = {
			name = "  TERMINAL",
			k = { "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", "Terminal Float" },
			m = { "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", "Terminal Float" },
			[","] = { "<C-\\><C-n><cmd>ToggleTerm size=10 direction=horizontal<cr>", "Terminal Bottom" },
			v = { "<C-\\><C-n><cmd>ToggleTerm size=50 direction=vertical<cr>", "Terminal Side" },
			["1"] = { "<C-\\><C-n><cmd>1ToggleTerm<cr>", "Terminal 1" },
			["2"] = { "<C-\\><C-n><cmd>2ToggleTerm<cr>", "Terminal 2" },
			["3"] = { "<C-\\><C-n><cmd>3ToggleTerm<cr>", "Terminal 3" },
			["4"] = { "<C-\\><C-n><cmd>4ToggleTerm<cr>", "Terminal 4" },
		},
	}
	local g_mappings = {
		c = {
			b = {
				name = "□  COMMENT BOX",
				b = { "<Cmd>CBccbox<CR>", "Box Title" },
				t = { "<Cmd>CBllline<CR>", "Titled Line" },
				l = { "<Cmd>CBline<CR>", "Simple Line" },
				m = { "<Cmd>CBllbox14<CR>", "Marked" },
				d = { "<Cmd>CBd<CR>", "Remove a box" },
			},
		},
	}

	local n_mappings = {
		-- A = { "<cmd>Alpha<CR>" },
		b = {
			name = "  BUFFERS",
			l = { "<cmd>ls<CR>", "List" },
			b = { "<cmd>bn<CR>", "Next" },
			n = { "<cmd>bp<CR>", "Prev" },
			k = { "<cmd>lua MiniBufremove.delete()<CR>", "Delete" },
			u = { "<cmd>lua MiniBufremove.unshow<CR>", "Unload" },
			f = { "<cmd>set shiftwidth=4 | set tabstop=4 | set softtabstop=4<CR>", "Fix Spacing" },

			m = { "<cmd>ToggleTerm direction=float<CR>", "Terminal Float" },
			[","] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Terminal Bottom" },
			v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "Terminal Side" },
			["1"] = { "<cmd>1ToggleTerm<cr>", "Terminal 1" },
			["2"] = { "<cmd>2ToggleTerm<cr>", "Terminal 2" },
			["3"] = { "<cmd>3ToggleTerm<cr>", "Terminal 3" },
			["4"] = { "<cmd>4ToggleTerm<cr>", "Terminal 4" },
		},
		p = {
			name = "󰏖  LAZY",
			C = { "<cmd>Lazy clean<cr>", "Clean" },
			c = { "<cmd>Lazy log<cr>", "Log" },
			i = { "<cmd>Lazy install<cr>", "Install" },
			s = { "<cmd>Lazy sync<cr>", "Sync" },
			S = { "<cmd>Lazy show<cr>", "Status" },
			u = { "<cmd>Lazy update<cr>", "Update" },
		},
		P = {
			name = "  POMO",
			["1"] = { "<cmd>TimerStart 1m<cr>", "1m" },
			["5"] = { "<cmd>TimerStart 5m<cr>", "5m" },
			H = { "<cmd>TimerStart 30m<cr>", "30m" },
			h = { "<cmd>TimerStart 1h<cr>", "1h" },
			s = { "<cmd>TimerStart ", "Start" },
			r = { "<cmd>TimerRepeat<cr>", "Repeat" },
			R = { "<cmd>TimerResume<cr>", "Resume" },
			p = { "<cmd>TimerPause<cr>", "Pause" },
			v = { "<cmd>TimerShow<cr>", "Show" },
			S = { "<cmd>TimerStop<cr>", "Stop" },
		},
		o = {
			name = "  OPTIONS",
			o = { "<cmd>Ranger<cr>", "Ranger" },
			w = { "<cmd>lua require('shadovim.config.utils').toggle_option('wrap')<cr>", "Wrap" },
			s = { "<cmd>lua require('shadovim.config.utils').toggle_option('spell')<cr>", "Spell" },
			n = { "<cmd>lua require('shadovim.config.utils').toggle_option('number')<cr>", "Number" },
			r = { "<cmd>lua require('shadovim.config.utils').toggle_option('relativenumber')<cr>", "Relative Number" },
		},
		w = {
			name = "  WINDOWS",
			v = { "<C-w>v", "Vertical Split" },
			h = { "<C-w>s", "Horizontal Split" },
			e = { "<C-w>=", "Make Splits Equal" },
			q = { "<cmd>close<CR>", "Close Split" },
		},
		t = {
			name = "  TELESCOPE",
			f = { "<cmd>Telescope find_files<cr>", "Find Files" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
			w = { "<cmd>Telescope live_grep<cr>", "Find Text" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
			h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
			H = { "<cmd>Telescope highlights<cr>", "Highlights" },
			p = { "<cmd>Telescope projects<cr>", "Projects" },

			n = { "<cmd>Telescope noice<cr>", "Noice Messages" },
			u = { "<cmd>Telescope undo<cr>", "Undo" },
			m = { "<cmd>Telescope macroscope<cr>", "Macros" },
			y = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
			o = { "<cmd>Telescope harpoon marks<cr>", "Harpoon" },
			t = { "<cmd>TodoTelescope<cr>", "Todo" },
		},
		g = {
			name = "󰊢  GIT",
			g = { "<cmd>LazyGit<cr>", "Lazygit" },
			G = { "<cmd>LazyGitConfig<cr>", "Lazygit Config" },
			j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
			k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
			r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
			R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
			s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
			S = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
			B = { "<cmd>Gitsigns blame_line{full=true}<cr>", "Blame Line Full" },
			o = { "<cmd>Telescope git_status<cr>", "Open Changed File" },
			c = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
			m = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		},
		l = {
			name = "  LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			I = { "<cmd>LspInfo<cr>", "Info" },
			j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic" },
			k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },

			A = { "<cmd>AerialToggle", "Aerial" },
			N = { "<cmd>AerialNavToggle", "Aerial Nav" },
			n = { "<cmd>Navbuddy", "Navbuddy" },

			i = { "<cmd>TSInstallInfo<cr>", "Treesitter Info" },
			u = { "<cmd>TSUpdate<cr>", "Treesitter Update" },
		},
		f = {
			name = "  FILES",
			e = { ":Neotree toggle<CR>", "Neo-Tree" },
			r = { "<cmd>Telescope oldfiles<CR>", "Recent" },
			f = { "<cmd>Telescope find_files<cr>", "Find" },
			j = { "<cmd>lua require('jot').toggle()<CR>", "Jot" },
		},
		n = {
			name = "  NEOGEN",
			n = { "<cmd>Neogen<CR>", "Any" },
			f = { "<cmd>Neogen func<CR>", "Function" },
			t = { "<cmd>Neogen type<CR>", "Type" },
			c = { "<cmd>Neogen class<CR>", "Class" },
			l = { "<cmd>Neogen file<CR>", "File" },
		},
		d = {
			name = "  DEBUG",
			b = { '<cmd>lua require("dap").toggle_breakpoint()<CR>', "Breakpoint" },
			c = { '<cmd>lua require("dap").continue()<CR>', "Continue" },
			j = { '<cmd>lua require("dap").down()<CR>', "Down STrace" },
			k = { '<cmd>lua require("dap").up()<CR>', "Up STrace" },
			l = { '<cmd>lua require("dap").run_last()<CR>', "Run Last" },
			q = { '<cmd>lua require("dap").terminate()<CR>', "Terminate" },
			u = { '<cmd>lua require("dapui").toggle()<CR>', "UI" },
			f = { '<cmd>lua require("dapui").float_element()<CR>', "Float" },
			p = { '<cmd>lua require("dap.ui.widgets").preview()<CR>', "Preview" },
			K = { '<cmd>lua require("dap.ui.widgets").hover()<CR>', "Hover" },
			-- ["{"] = { '<cmd>lua require("dap.ui.variables").scopes()<CR>',   "Scopes" },
			s = {
				name = " STEP",
				i = { '<cmd>lua require("dap").step_into()<CR>', "Into" },
				o = { '<cmd>lua require("dap").step_over()<CR>', "Over" },
				x = { '<cmd>lua require("dap").step_out()<CR>', "Out" },
			},
		},
		m = {
			name = "  MISC",
			t = { "<cmd>lua MiniTrailspace.trim()<CR>", "Trim Trailspace" },
			m = { "<cmd>lua MiniMap.toggle()<CR>", "Minimap" },
			R = { "<cmd>lua MiniMap.refresh()<CR>", "Refresh Minimap" },
		},
		s = {
			name = "  SESSION",
			s = {
				function()
					require("resession").save()
				end,
				"Save",
			},
			l = {
				function()
					require("resession").load()
				end,
				"Load",
			},
			d = {
				function()
					require("resession").delete()
				end,
				"Delete",
			},
		},
		["<leader>"] = {
			name = "󰢚  Shadovim",
			u = { "<cmd>ShadovimUpdate<cr>", "Update Shadovim" },
			m = { "<cmd>ShadovimCheckMason<cr>", "Check Mason" },
			r = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Reload Config" },
		},
	}

	local wk = require("which-key")
	wk.register(m_mappings, { buffer = nil, silent = true, noremap = true, nowait = true, mode = "n" })
	wk.register(n_mappings, { buffer = nil, silent = true, noremap = true, nowait = true, mode = "n", prefix = "<leader>" })
	wk.register(g_mappings, { buffer = nil, silent = true, noremap = true, nowait = true, mode = "n", prefix = "<leader>" })
	wk.register(v_mappings, { buffer = nil, silent = true, noremap = true, nowait = true, mode = "v", prefix = "<leader>" })
	wk.register(t_mappings, { buffer = nil, silent = true, noremap = true, nowait = true, mode = "t", prefix = "<leader>" })
end

--------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Selection
map("n", "<C-a>", "ggVG", opts, { desc = "Select All" })

-- Save/Quit
map("n", "<C-s>", ":silent w<CR>", opts, { desc = "Save" })
map("i", "<C-s>", "<ESC>:silent w<CR>", opts, { desc = "Save (Insert)" })
map("n", "<Leader>q", ":qa!<CR>", opts, { desc = "Quit" })

-- Moving Text
map({ "n", "i" }, "<C-Up>", "<Esc>:m-2<CR>", opts, { desc = "Move Line Up" })
map({ "n", "i" }, "<C-Down>", "<Esc>:m+<CR>", opts, { desc = "Move Line Down" })
map("x", "<C-Up>", ":m '<-2<CR>gv-gv", opts, { desc = "Move Selection Up" })
map("x", "<C-Down>", ":m '>+1<CR>gv-gv", opts, { desc = "Move Selection Down" })
map("v", "<F3>", "y<c-w>wp<c-w>gv", opts, { desc = "Copy text from current split to next" })
map("v", "<F4>", "d<c-w>wp<c-w>gv", opts, { desc = "Move text from current split to next" })

-- Resizing
map("n", "<Up>", ":resize +2<CR>", opts, { desc = "Resize Window Up" })
map("n", "<Down>", ":resize -2<CR>", opts, { desc = "Resize Window Down" })
map("n", "<Left>", ":vertical resize +2<CR>", opts, { desc = "Resize Window Left" })
map("n", "<Right>", ":vertical resize -2<CR>", opts, { desc = "Resize Window Right" })

-- General Movement
-- map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true }, { desc = "Move Cursor Down (Allow Wrapped)" })
-- map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true }, { desc = "Move Cursor Up (Allow Wrapped)" })
map("n", "<C-h>", "<C-w>h", opts, { desc = "Move Cursor Left Buffer" })
map("n", "<C-j>", "<C-w>j", opts, { desc = "Move Cursor Down Buffer" })
map("n", "<C-k>", "<C-w>k", opts, { desc = "Move Cursor Up Buffer" })
map("n", "<C-l>", "<C-w>l", opts, { desc = "Move Cursor Right Buffer" })
map("i", "<C-j>", "<Down>", opts, { desc = "Move Cursor Down in Insert Mode" })
map("i", "<C-k>", "<Up>", opts, { desc = "Move Cursor Up in Insert Mode" })
map("i", "<C-h>", "<Left>", opts, { desc = "Move Cursor Left in Insert Mode" })
map("i", "<C-l>", "<Right>", opts, { desc = "Move Cursor Right in Insert Mode" })

map("n", "s", ":HopChar1<cr>", opts)
map("n", "S", ":HopPattern<cr>", opts)

map({ "n", "o" }, "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
map({ "n", "o" }, "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
map({ "n", "o" }, "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
map({ "n", "o" }, "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

-- Split Management
map("t", "<C-S-h>", "<C-\\><C-N><C-w>h", opts, { desc = "Move out of terminal to split left" })
map("t", "<C-S-j>", "<C-\\><C-N><C-w>j", opts, { desc = "Move out of terminal to split up" })
map("t", "<C-S-k>", "<C-\\><C-N><C-w>k", opts, { desc = "Move out of terminal to split down" })
map("t", "<C-S-l>", "<C-\\><C-N><C-w>l", opts, { desc = "Move out of terminal to split right" })
map("n", "<leader>h", "<C-w>h", opts, { desc = "Move to split left" })
map("n", "<leader>l", "<C-w>l", opts, { desc = "Move to split up" })
map("n", "<leader>j", "<C-w>j", opts, { desc = "Move to split down" })
map("n", "<leader>k", "<C-w>k", opts, { desc = "Move to split right" })
map("n", "Ww", "<C-w>c", opts, { desc = "Close split" })
map("n", "Wb", "<C-w>=", opts, { desc = "Balance splits" })

-- Buffers
map("n", "<C-S-j>", ":CybuLastusedNext<cr>", opts, { desc = "Cybu goto last next buffer" })
map("n", "<C-S-k>", ":CybuLastusedPrev<cr>", opts, { desc = "Cybu goto last prev buffer" })
map("n", "<TAB>", ":CybuLastusedNext<cr>", opts, { desc = "Cybu goto last next buffer" })
map("n", "<S-TAB>", ":CybuLastusedPrev<cr>", opts, { desc = "Cybu goto last prev buffer" })
map("n", "<c-i>", "<c-i>", opts)
map("n", "<leader><cr>", "<cmd>Bufala split<cr>", opts, { desc = "Stack split" })
map("n", "<leader>J", ":JABSOpen<CR>", opts, { desc = "Open JABS" })

-- Tabs
--- Switch Tab
for i, sym in ipairs({ "!", "@", "#", "$", "%", "^", "&", "*", "(" }) do
	map("n", "<leader>" .. sym, "<cmd>Tabbot send " .. i .. "<cr>", opts, { desc = "Send to Tab " .. i })
end

-- Searching
map("n", "<Enter>", "<cmd>nohlsearch<CR>", opts, { desc = "Clear Highlight" })
map("n", "n", "nzzzv", opts, { desc = "Center screen on search" })
map("n", "N", "Nzzzv", opts, { desc = "Center screen on search back" })
map("n", "<leader>R", "<esc><esc>:%s///gcI<left><left><left><left><left>", opts, { desc = "Search and Replace" })

-- Telescope
map("n", "<C-f>", "<esc><cmd>Telescope find_files<cr>", opts, { desc = "Telescope find files" })
map("i", "<C-f>", "<esc><cmd>Telescope live_grep<cr>", opts, { desc = "Telescope live grep" })
map("n", "<C-A-f>", "<esc><esc><C-w>v<cmd>Telescope find_files<CR>", opts, { desc = "Telescope find files in new split" })

-- Debugging
map("n", "<F11>", '<cmd>lua require("dap").step_into()<CR>', opts, { desc = "Debugger step into" })
map("n", "<F10>", '<cmd>lua require("dap").step_over()<CR>', opts, { desc = "Debugger step over" })
map("n", "<F9>", '<cmd>lua require("dap").step_out()<CR>', opts, { desc = "Debugger step out" })

-- Miscellaneous
map("n", "<F3>", ":set invnumber invrelativenumber<CR>", opts, { desc = "Toggle Line Numbers" })
map("n", "<leader>A", ":Alpha<CR>", opts, { desc = "Open Alpha" })
map("n", "<leader>V", ":ToggleVenn<CR>", opts, { desc = "Toggle Venn Mode" })

map("n", "<Leader><TAB>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, no_ignore=true, follow=true, hidden=true})<cr>", opts)
vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")]])

-- Renaming
vim.api.nvim_set_keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

return M
