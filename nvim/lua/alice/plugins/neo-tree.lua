return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					never_show = { ".git" },
				},
			},
		})
		vim.keymap.set(
			"n",
			"<leader>ee",
			":Neotree filesystem reveal toggle left<CR>",
			{ desc = "Toggle the file explorer" }
		)
		vim.keymap.set(
			"n",
			"<leader>eb",
			":Neotree buffers reveal toggle float<CR>",
			{ desc = "View the buffer files" }
		)
		vim.keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
	end,
}
