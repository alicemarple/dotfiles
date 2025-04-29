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
		})
	end,
}
