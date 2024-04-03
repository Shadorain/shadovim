return {
	"NvChad/nvim-colorizer.lua",
	event = "BufRead",
	opts = function()
		vim.defer_fn(function()
			require("colorizer").attach_to_buffer(0)
		end, 0)
		return require("colorizer").setup()
	end,
}
