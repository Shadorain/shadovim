return {
	"ghillb/cybu.nvim",
	cmd = { "CybuNext", "CybuPrev", "CybuLastusedNext", "CybuLastusedPrev" },
	opts = {
		position = {
			anchor = "topright",
		},
		behavior = {
			mode = { last_used = { switch = "immediate" }, auto = { view = "paging" } },
		},
		display_time = 1750,
	},
}
