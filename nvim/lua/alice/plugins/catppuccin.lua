return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				which_key = true,
				notify = true,
				alpha = true,
				snacks = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
