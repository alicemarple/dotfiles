return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true, -- enable lualine golbally if want to disable for anything add in below line
				disabled_filetypes = { "alpha", "snacks_picker_input" },
			},
			sections = {
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 1 } },
					-- { "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%I:%M")
					end,
				},
			},
		})
	end,
}
