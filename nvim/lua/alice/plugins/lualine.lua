return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true, -- enable lualine golbally if want to disable for anything add in below line
				disabled_filetypes = { "alpha", "TelescopePrompt", "snacks_picker_input" },
			},
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "filename", "diagnostics" },
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 1 } },
				},
				lualine_z = { "location" },
			},
		})
	end,
}
