return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			"git_status",
		},
		view_options = {
			show_hidden = true,
		},
		delete_to_trash = true,
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ec", "<cmd>Oil<CR>", desc = "open current file" },
		{ "<leader>ee", "<cmd>Oil .<CR>", desc = "open explore" },
	},
	lazy = false,
}
