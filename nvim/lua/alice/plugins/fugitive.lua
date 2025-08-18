return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>ps", "<cmd>Git<CR>", desc = "Fugitive status" },
		{ "<leader>pb", "<cmd>Git blame<CR>", desc = "Fugitive blame" },
		{ "<leader>pd", "<cmd>Gvdiffsplit HEAD<CR>", desc = "Fugitive diff" },
		{ "<leader>pc", "<cmd>Git commit<CR>", desc = "Fugitive commit" },
	},
}
