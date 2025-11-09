return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {

					git_status = {
						symbols = {
							added = "+",
							modified = "!",
							untracked = "?",
							unstaged = "-",
							staged = "*",
						},
					},

					diagnostics = {
						symbols = {
							hint = " ",
							info = " ",
							warn = " ",
							error = " ",
						},
					},
				},
			})

			--    Keymap to toggle Neo-tree
			vim.keymap.set("n", "<leader>ee", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neo-tree", silent = true })
			vim.keymap.set(
				"n",
				"<leader>ec",
				"<CMD>Neotree reveal toggle<CR>",
				{ desc = "Open current file", silent = true }
			)
		end,
	},
}
