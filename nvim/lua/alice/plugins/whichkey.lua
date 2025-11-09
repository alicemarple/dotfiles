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
			{ "<leader>f", group = "Find" },
			{ "<leader>a", group = "Action" },
			{ "<leader>t", group = "Tab" },
			{ "<leader>s", group = "Search" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>g", group = "Git" },
			{ "<leader>T", group = "Test" },
			{ "<leader>p", group = "Fugitive" },
			{ "<leader>l", group = "Lsp" },
		})
	end,
}
