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
          never_show = {".git"},
        },
      },
    })
		vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal toggle left<CR>", {desc ="Toggle the file explorer"})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {desc = "View the buffer files"})
	end,
}
