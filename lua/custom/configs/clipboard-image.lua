require("clipboard-image").setup({
	default = {
		img_dir = "/home/shadow/Pictures/nv_img/",
		img_dir_text = "/home/shadow/Pictures/nv_img/",
		img_name = function()
			vim.fn.inputsave()
			local name = vim.fn.input("Name: ")
			vim.fn.inputrestore()

			if name == nil or name == "" then
				return os.date("%y-%m-%d-%H-%M-%S")
			end
			return name
		end, -- function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-02"
		affix = "![Img](%s)",
	},
})
