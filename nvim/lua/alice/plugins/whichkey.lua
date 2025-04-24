return {
	"folke/which-key.nvim",
	opts = {
		icons = {
			mappings = false, -- disables icon mappings if the plugin supports this option
		},
	},
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
		local wk = require("which-key")
		wk.add({
			{ "<leader>ff", group = "Find Files" },
			{ "<leader>sg", group = "Live Grep" },
			{ "<leader>ee", group = "Explorer" },
			{ "<leader>g", group = "Git" },
			{ "<leader>T", group = "Test" },
		})
	end,
}
