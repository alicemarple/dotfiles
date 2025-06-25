return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
		{ "<leader>ec", "<cmd>Neotree reveal<CR>", desc = "Reveal current file in explorer" },
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						added = "+",
						modified = "!",
						deleted = "-",
						renamed = "r",
						untracked = "?",
						unstaged = "u",
						staged = "*",
						stashed = "≡",
					},
				},
			},
		})
	end,
}
