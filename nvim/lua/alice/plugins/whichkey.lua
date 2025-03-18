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
			{ "<leader>f", group = "Files" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>n", group = "Neotree" },
			{ "<leader>g", group = "Git" },
			{ "<leader>x", group = "Diagnostics" },
			{ "<leader>T", group = "Test" },
		})
	end,
}
