return {
	"numToStr/FTerm.nvim",
	event = "VeryLazy",
	config = function()
		require("FTerm").setup({
			border = "single",
			dimensions = {
				height = 0.9,
				width = 0.9,
				border = "single",
			},
		})

		-- Example keybindings
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
