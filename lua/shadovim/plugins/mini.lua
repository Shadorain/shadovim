return {
	"echasnovski/mini.nvim",
	event = "BufWinEnter",
	config = function()
		-- Auto commands
		vim.api.nvim_create_autocmd("TermOpen", { pattern = { "*" }, command = "lua vim.b.minicursorword_disable = true" })
		vim.api.nvim_create_autocmd("User", { pattern = { "AlphaReady" }, command = "lua vim.b.miniindentscope_disable = true" })

		local status_ok_br, mini_bufremove = pcall(require, "mini.bufremove")
		if status_ok_br then
			mini_bufremove.setup()
		end

		local status_ok_ts, mini_trailspace = pcall(require, "mini.trailspace")
		if status_ok_ts then
			mini_trailspace.setup()
		end

		-- Visualize and operate on indent scope
		local status_ok_id, mini_indent = pcall(require, "mini.indentscope")
		if status_ok_id then
			mini_indent.setup({
				symbol = "│",
			})
		end

		local status_ok_al, mini_align = pcall(require, "mini.align")
		if status_ok_al then
			mini_align.setup()
		end

		local status_ok_cw, mini_cursorword = pcall(require, "mini.cursorword")
		if status_ok_cw then
			vim.cmd([[ hi MiniCursorword gui=bold ]])
			mini_cursorword.setup({
				delay = 100,
			})
		end
	end,
}
