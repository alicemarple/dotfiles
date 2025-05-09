return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Code actions
				null_ls.builtins.code_actions.gitsigns,

				-- Diagnostics
				null_ls.builtins.diagnostics.erb_lint,

				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.shellharden,
			},
		})

		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format the buffer" })
	end,
}
