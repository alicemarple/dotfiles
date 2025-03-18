return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/todo-comments.nvim",
		},
		-- NOTE: Install ripegrep for this

		config = function()
			require("telescope").setup()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search the files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live string search in whole project" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Files from buffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find the diagnostics" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find the recent files" })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
			require("telescope").load_extension("ui-select")
		end,
	},
}
