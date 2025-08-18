return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				disabled_filetypes = { "alpha", "TelescopePrompt" },
			},
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "filename", "diagnostics" },
				lualine_y = {
					{ "progress", padding = { left = 1, right = 1 } },
				},
				lualine_z = { "location" },
			},
		})
	end,
}
