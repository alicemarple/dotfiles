return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Code actions
				null_ls.builtins.code_actions.gitsigns,
				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format the buffer" })
	end,
}
